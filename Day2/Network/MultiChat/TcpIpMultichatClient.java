package MultiChat;

import com.sun.org.apache.xml.internal.serializer.utils.SerializerMessages_zh_CN;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ConnectException;
import java.net.Socket;
import java.util.Scanner;

public class TcpIpMultichatClient {
    public static void main(String[] args) {
        if(args.length != 1) {
            System.out.println("USAGE: java TcpIpMultichatClient 대화명");
            System.exit(0);
        }

        try {
            String serverIp = "127.0.0.1";
            Socket socket = new Socket(serverIp, 7778);
            System.out.println("서버에 연결되었습니다..");

            // 메세지르 보내기도
            Thread sender = new Thread(new ClientSender(socket, args[0]));
            // 메세지를 받기도 함
            Thread receiver = new Thread(new ClientReceiver(socket));

            sender.start();
            receiver.start();
        } catch(ConnectException ce) {
            ce.printStackTrace();
        } catch(Exception e) {

        }
    }

    static class ClientSender extends Thread {
        Socket socket;
        DataOutputStream out;
        String name;

        ClientSender(Socket socket, String name) {
            this.socket = socket;

            try{
                out = new DataOutputStream(socket.getOutputStream());
                this.name = name;
            } catch(IOException e) {
                // do nothing..
            }
        }

        public void run() {
            Scanner scanner = new Scanner(System.in);
            try {
                if (out != null) {
                    out.writeUTF(name);
                }

                while(out!= null) {
                    out.writeUTF("[" + name + "]" + scanner.nextLine());
                }
            } catch(IOException e) {

            }
        }
    }

    static class ClientReceiver extends Thread {
        Socket socket = null;
        DataInputStream in;

        ClientReceiver(Socket socket) {
            this.socket = socket;
            try {
                in = new DataInputStream(socket.getInputStream());
            } catch(IOException e) {
                // do nothing..
            }
        }

        public void run() {
            while(in != null) {
                try {
                    System.out.println(in.readUTF());
                } catch(IOException e) {

                }
            }
        }
    }
}
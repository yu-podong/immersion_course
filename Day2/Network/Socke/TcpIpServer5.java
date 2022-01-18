package Socke;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

class Sender extends Thread {
    Socket socket;
    DataOutputStream out;
    String name;

    Sender(Socket socket) {
        this.socket = socket;
        try {
            out = new DataOutputStream(socket.getOutputStream());
            name = "[" + socket.getInetAddress()+ ":" + socket.getPort() + "]";
        } catch(Exception e) {

        }
    }

    public void run() {
        Scanner scanner = new Scanner(System.in);

        while(out != null) {
            try {
                out.writeUTF(name+scanner.nextLine());
            } catch (IOException e) {

            }
        }
    }
}

class Receiver extends Thread {
    Socket socket;
    DataInputStream in;

    Receiver(Socket socket) {
        this.socket = socket;

        try {
            in = new DataInputStream(socket.getInputStream());
        } catch(IOException e) {}
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

public class TcpIpServer5 {
    public static void main(String[] args) {
        ServerSocket serverSocket = null;
        Socket socket = null;

        try {
            // 서버 소캣을 생성하여, 7777번 포트와 결합(bind)한다.
            serverSocket = new ServerSocket(7777);
            System.out.println("서버 준비가 완료되었습니다.");

            socket = serverSocket.accept();

            Sender sender = new Sender(socket);
            Receiver receiver = new Receiver(socket);

            sender.start();
            receiver.start();
        } catch(IOException e) {
            e.printStackTrace();
        }

    }
    // 현재시간을 문자열로 반환하는 함수
    static String getTime() {
        SimpleDateFormat f = new SimpleDateFormat("[hh:mm:ss]");
        return f.format(new Date());
    }
}

package MultiChat;

import com.sun.corba.se.spi.activation.Server;
import com.sun.org.apache.xerces.internal.util.ShadowedSymbolTable;
import com.sun.xml.internal.ws.server.ServerRtException;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

public class TcpIpMultichatServer {
    // 채팅 멤버의 정보를 저장
    HashMap clients;

    TcpIpMultichatServer() {
        clients = new HashMap();
        // Map을 동기화시켜주는 함수 (Collection 안에 존재)
        Collections.synchronizedMap(clients);
    }

    public void start() {
        ServerSocket serverSocket = null;
        Socket socket = null;

        try {
            serverSocket = new ServerSocket(7777);
            System.out.println("서버가 시작되었습니다.");

            while(true) {
                socket = serverSocket.accept();
                System.out.println("[" + socket.getInetAddress()+ ":" + socket.getPort() + "]");
                // 여러 사용자가 보낸 메세지를 전부 받음(추후 spread)
                ServerReceiver thread = new ServerReceiver(socket);

                thread.start();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    void sendToAll(String msg) {
        // Map의 key값만 추출 -> return type = Set(집합)
        // key value는 중복되면 안되기 떄문에
        // Set의 각 요소에 접근하기 위해 객체를 사용 -> iterator
        Iterator it = clients.keySet().iterator();

        while(it.hasNext()) {
            try {
                DataOutputStream out = (DataOutputStream) clients.get(it.next());
                out.writeUTF(msg);
            } catch(IOException e) {

            }
        }
    }

    public static void main(String[] args) {
        new TcpIpMultichatServer().start();
    }

    // 내부 클래스 -> 다른 객체에서 해당 클래스를 사용할 일이 없을 떄 활용
    class ServerReceiver extends Thread {
        Socket socket;
        DataInputStream in;
        DataOutputStream out;

        ServerReceiver(Socket socket) {
            this.socket = socket;

            try {
                in = new DataInputStream(socket.getInputStream());
                out = new DataOutputStream(socket.getOutputStream());
            } catch(IOException e) {

            }
        }

        public void run() {
            String name = "";

            try {
                name = in.readUTF();
                sendToAll("# " + name + "님이 들어오셨습니다.");
                
                // 입장한 사용자의 정보를 Map에 추가
                clients.put(name, out);
                System.out.println("현재 서버접속자 수는 " + clients.size() + "입니다.");

                while(in != null) {
                    sendToAll(in.readUTF());
                }
            } catch(IOException e) {

            } finally {
                sendToAll("#" + name + "님이 나가셨습니다.");
                clients.remove(name);

                System.out.println("[" + socket.getInetAddress()+ ":" + socket.getPort() + "]에서 접속을 종료하셨습니다.");
                System.out.println("현재 서버접속자 수는 " + clients.size() + "입니다,");
            }
        }
    }
}

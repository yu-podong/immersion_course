package Socke;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TcpIpServer {
    public static void main(String[] args) {
        ServerSocket serverSocket = null;

        try {
            // 서버 소캣을 생성하여, 7777번 포트와 결합(bind)한다.
            serverSocket = new ServerSocket(7777);
            System.out.println();
        } catch(IOException e) {
            e.printStackTrace();
        }

        while(true) {
            try {
                System.out.println(getTime() + "연결요청을 기다립니다.");
                // 서버소캣은 클라이언트의 연결요청이 올떄까지 실행을 멈추고 계쏙 기다린다.
                // 클라이언트의 연결요청이 오면 클라이언트 소갯과 통신할 새로운 소캣을 생성
                Socket socket = serverSocket.accept();
                System.out.println(getTime()+socket.getInetAddress()+"로부터 연결요청이 들어온다.");

                // 소캣의 출력스트림을 얻는다.
                OutputStream out = socket.getOutputStream();
                DataOutputStream dos = new DataOutputStream(out);

                // 원격 소캣(remote socket)에 데이터를 보낸다.
                dos.writeUTF("[Notice] Test Message1 from Serer");
                System.out.println(getTime()+"데이터를 전송했습니다.");

                // 스트림과 소캣을 닫아준다.
                dos.close();
                socket.close();
            } catch(IOException e) {
                e.printStackTrace();
            }
        }


    }
    // 현재시간을 문자열로 반환하는 함수
    static String getTime() {
        SimpleDateFormat f = new SimpleDateFormat("[hh:mm:ss]");
        return f.format(new Date());
    }
}

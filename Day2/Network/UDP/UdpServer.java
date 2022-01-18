package UDP;

import java.net.*;
import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;

public class UdpServer {
	// Exception이 발생할 수 있는 부분
	// Exception이 발생하면, start를 호출한 부분에게 내던짐 (start method를 호출한 곳에서 처리하게끔)
	public void start() throws IOException {
		// 포트 7777번을 사용하는 소캣을 생성
		DatagramSocket socket = new DatagramSocket(7777);
		DatagramPacket inPacket, outPacket;

		byte[] inMsg = new byte[10];
		byte[] outMsg;

		while(true) {
			// 데이터를 수신하기 위한 패킷을 생성
			inPacket = new DatagramPacket(inMsg, inMsg.length);

			// 패킷을 통해 데이터를 수신(receive)
			socket.receive(inPacket);

			// 수신한 패킷으로부터 client의 IP주소와 Port를 얻는다.
			InetAddress address = inPacket.getAddress();
			int port = inPacket.getPort();

			// 서버의 현재 시간을 시분초([hh:mm:ss])로 반환
			SimpleDateFormat sdf = new SimpleDateFormat("[hh:mm:ss]");
			String time = sdf.format(new Date());
			outMsg = time.getBytes(); // time을 byte 배열로 생성

			// 패킷을 생성해서 client에게 전송(send)
			outPacket = new DatagramPacket(outMsg, outMsg.length, address, port);
			socket.send(outPacket);
		}
	} // start()

	public static void main(String args[]) {
		try {
			// <<start의 exception이 던져지는 곳>>
			new UdpServer().start(); // UDP 서버를 실행
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // main
}

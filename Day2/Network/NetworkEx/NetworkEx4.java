import java.net.*;
import java.io.*;

public class NetworkEx4 {
	public static void  main(String args[]) {
		URL url = null;
		BufferedReader input = null;
		String address = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=react";
		String line = "";

		try {
			url = new URL(address);

			// reaponse로 날아온 데이터를 console에 출력
			// Stream : 데이터가 흐를 수 있도록 연결해주는 통로
			// 보조 스트림 : BufferReader
		    input = new BufferedReader(new InputStreamReader(url.openStream()));

		    // 버퍼 안의 내용을 읽고, line 단위로 read & print
			while((line=input.readLine()) !=null) {
				System.out.println(line);
			}
			input.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

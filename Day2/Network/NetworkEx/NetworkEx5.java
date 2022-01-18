import java.net.*;
import java.io.*;

public class NetworkEx5 {
	// 특정 사이트에 있는 파일
	public static void  main(String args[]) {
		URL url = null;
		InputStream in = null;
		FileOutputStream out = null;
	    String address = "http://www.codechobo.com/book/src/javajungsuk_src.zip";

		int ch = 0;

		try {
			url = new URL(address);
			// URL에서 읽어온 데이터
			in = url.openStream();
			out = new FileOutputStream("javajungsuk_src.zip");

			// 위의 파일 이름으로, 해당 파일을 로컬에 다운로드
			while((ch=in.read()) !=-1) {
				out.write(ch);
			}
			in.close();
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // main
}

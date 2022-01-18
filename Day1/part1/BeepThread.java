package part1;

import java.awt.*;

// Thread class를 상속받아 작업 스레드 생성
public class BeepThread extends Thread {
    // 반드시 모든 Thread는 'run' -> thread가 수행해야 할 내용
    public void run() {
        Toolkit toolkit = Toolkit.getDefaultToolkit();

        // 5번의 Beep 실행
        for(int i = 0; i < 5; i++) {
            toolkit.beep();
            try {
                Thread.sleep(500);
            }
            catch(Exception e) {

            }
        }
    }
}

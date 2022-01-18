package part1;

public class BeepPrintExample2 {
    public static void main(String[] args) {
        // how1
        Runnable beepTask = new BeepTask();
        Thread thread = new Thread(beepTask);
        
        // thread에 있는 run function이 자동 호출
        thread.start();

        for(int i = 0; i < 5; i++) {
            System.out.println("Beep");
            try {
                Thread.sleep(500);
            } catch(Exception e) {

            }
        }
    }
}

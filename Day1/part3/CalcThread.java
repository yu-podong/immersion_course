package part3;

public class CalcThread extends Thread{
    // 해당 클래스를 생성할 때, thread name을 받아서 설정
    public CalcThread(String name) {
        setName(name);
    }

    public void run() {
        for(int i = 0; i<200000000; i++) {
            // nothing
        }

        System.out.println(getName());
    }
}

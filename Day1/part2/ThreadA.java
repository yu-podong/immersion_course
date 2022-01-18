package part2;

public class ThreadA extends Thread {
    public ThreadA() {
        // 작업 thread's name setting
        setName("ThreadA");
    }
    
    public void  run() {
        for(int i = 0; i< 2;i++) {
            System.out.println(getName()+"가 출력한 내용");
        }
    }
    
}

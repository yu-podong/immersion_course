package part4;

public class Calculator {
    private int memory;

    public int getMemory() {
        return memory;
    }

    // 동기화 진행 (synchronized 사용)
    public synchronized void setMemory(int memory) {
        // critical section
        this.memory = memory;

        try {
            Thread.sleep(2000);
        }
        catch(InterruptedException e) {

        }

        System.out.println(Thread.currentThread().getName() + " : " + this.memory);
    }
}

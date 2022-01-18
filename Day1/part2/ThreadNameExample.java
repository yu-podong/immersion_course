package part2;

public class ThreadNameExample {
    public static void main(String[] args) {
        // code를 실행하는 스레드 객체 참조
        Thread mainThread = Thread.currentThread();
        System.out.println("프로그램 시작 스레드 이름" + mainThread.getName());
        
        // 작업 스레드 생성
        ThreadA threadA = new ThreadA();
        System.out.println("작업 스레드 이름" + threadA.getName());
        // threadA 실행
        threadA.start();

        // 작업 스레드 생성
        ThreadB threadB = new ThreadB();
        System.out.println("작업 스레드 이름" + threadB.getName());
        // threadB 실행
        threadB.start();
    }
}

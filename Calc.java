/*
1. 계산기(사칙연산)
<class>
Calculatorulutor
User

2. CVS 관리 프로그램
<menu>
입고
판매 및 환불
재고 확인

<class - 3계층>
product
식음료  생활품 ...


3.
*/

import java.util.Scanner;

class Calculator {
    // sum
    public static float sum(float num1, float num2) {
        return num1+num2;
    }
    // sub
    public static float sub(float num1, float num2) {
        return num1-num2;
    }
    // multi
    public static float multi(float num1, float num2) {
        return num1*num2;
    }
    // div
    public static float div(float num1, float num2) {
        return num1/num2;
    }
}

class User {
    private int menuNum;
    private float num1;
    private float num2;
    private float result;

    User() {

    }

    public void printMenu() {
        System.out.println("<계산기 메뉴를 입력하세요>");
        System.out.println("1. sum");
        System.out.println("2. sub");
        System.out.println("3. multi");
        System.out.println("4. div");
        System.out.println("5. exit");
    }

    // Calculatorulator 실행 함수
    public void execMenu() {
        // 입력된 메뉴에 따라 알맞은 사칙연산 진행
        if(menuNum == 1) {
            result = Calculator.sum(num1, num2);
        }
        else if(menuNum == 2) {
            result = Calculator.sub(num1, num2);
        }
        else if(menuNum == 3) {
            result = Calculator.multi(num1, num2);
        }
        else if(menuNum == 4) {
            result = Calculator.div(num1, num2);
        }

        System.out.println("\n" + menuNum + "번 실행 결과 = "+ result);
        System.out.println("=========================\n");
    }

    public void setMenuNum(int menu) {
        this.menuNum = menu;
    }
    public void setNum1(float num1) {
        this.num1 = num1;
    }
    public void setNum2(float num2) {
        this.num2 = num2;
    }
}

public class Calc {
    public static void main(String[] args) {
        User user = new User();
        int menuNum = 0;
        float num1 = 0, num2 = 0;

        Scanner sc = new Scanner(System.in);

        while(true) {
            user.printMenu();

            // 메뉴 번호 선택
            System.out.println("Menu번호 선택 : ");
            menuNum = sc.nextInt();

            user.setMenuNum(menuNum);

            // 선택한 번호에 따른 진행
            if(menuNum == 5) {
                break;
            }
            else {
                System.out.println("\n계산할 두 숫자 입력 : ");
                num1 = sc.nextFloat();
                num2 = sc.nextFloat();

                user.setNum1(num1);
                user.setNum2(num2);

                user.execMenu();
            }
        }

    }
}

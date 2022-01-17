import java.util.Scanner;

class progMenu {

}

/*Level 1*/
// 모든 물품
class Product {
    protected int totalCount;
    protected Beverage beverList;
    protected Dessert dessertList;
    protected Goods goodsList;

    Product() {
        totalCount = 0;
        beverList = new Beverage();
        dessertList = new Dessert();
        goodsList = new Goods();
    }

    public static void printMenu() {
        System.out.println("<<CVS 관리 프로그램>>");
        System.out.println("1. 제품 입고");
        System.out.println("2. 판매");
        System.out.println("3. 환불");
        System.out.println("4. 재고 확인");
        System.out.println("5. 종료");
    }

    // 입고
    public void store() {
        // 입고된 물건 정보 입력
        
        // 입고된 level3 count ++
        // 입고된 level2 count ++
        // level1 count ++
    }
    // 판매
    public void sale() {
        // 판매된 level3의 count --
        // 판매된 level2의 count--
        // 판매된 level1의 count--
        // 판매금액 ++
    }
    // 환불
    public void refund() {
        // 판매된 level3의 count ++
        // 판매된 level2의 count ++
        // 판매된 level1의 count ++
        // 판매금액 --
    }
    // 재고확인
    public void checkRemain() {
        // level2는 각 2가지 부류에 대한 재고 확인
        // level1은 각 3가지 루뷰에 대한 재고 확인
    }
}

/*Level 2*/
// 음료
class Beverage extends Product {
    protected int beverCount;
    protected Juice[] juiceList;
    protected Coffee[] coffeeList;

    Beverage() {
        beverCount = 0;
        juiceList = new Juice[1];
        coffeeList = new Coffee[1];
    }
}

// 간식
class Dessert extends Product{
    protected int dessertCount;
    protected Biscat[] bisList;
    protected Choco[] chocoList;

    Dessert() {
        dessertCount = 0;
        bisList = new Biscat[1];
        chocoList = new Choco[1];
    }
}

// 생활용품
class Goods extends Product{
    protected int goodslCount;
    protected Tissue[] tisList;
    protected Toothbrush[] toothList;

    Goods() {
        goodslCount = 0;
        tisList = new Tissue[1];
        toothList = new Toothbrush[1];
    }
}

/*Level 3*/
//쥬스
class Juice extends Beverage{
    public String name;
    public int count;
    public int price;
}
// 커피
class Coffee extends Beverage{
    public String name;
    public int count;
    public int price;
}

// 비스캣
class Biscat  extends Dessert{
    public String name;
    public int count;
    public int price;
}
// 초콜릿
class Choco  extends Dessert{
    public String name;
    public int count;
    public int price;
}
// 휴지
class Tissue  extends Goods{
    public String name;
    public int count;
    public int price;
}
// 칫솔
class Toothbrush  extends Goods{
    public String name;
    public int count;
    public int price;
}

public class CVS {
    public static void main(String[] argc) {
        Scanner sc = new Scanner(System.in);

        Product product = new Product();
        int menuMenu, productNum, subNum;

        while(true) {
            Product.printMenu();

            System.out.println("실행할 메뉴를 선택하세요 : ");
            menuMenu = sc.nextInt();

            if(menuMenu == 1) {
                System.out.println("입고된 제품의 부류를 선택하세요 : ");
                productNum = sc.nextInt();
                
                // 음료
                if(productNum == 1) {
                    System.out.println("입고된 제품의 종류를 선택하세요 : ");
                    subNum = sc.nextInt();
                    
                    // 쥬스
                    if(subNum == 1) {
                        // 새로운 객체 생성
                        Juice newitem = new Juice();
                        // 정보 입력
                        newitem.name = "오랜지쥬스";
                        newitem.count = 1;
                        newitem.price = 2000;
                        
                        // 음료의 Juicelist 와 연결
                    }
                    // 커피
                    else if(subNum == 2) {

                    }
                }
                // 간식
                else if(productNum == 2) {

                }
                // 생활용품
                else if(productNum == 3) {

                }
            }
            else if(menuMenu == 2) {

            }
            else if(menuMenu == 3) {

            }
            else if(menuMenu == 4) {

            }
            else if(menuMenu == 5) {

            }
            else {

            }
        }
    }
}

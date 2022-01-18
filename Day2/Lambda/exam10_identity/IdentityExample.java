package exam10_identity;

import java.util.function.UnaryOperator;

public class IdentityExample {
	public static void main(String[] args) {
		UnaryOperator<Member> operator = UnaryOperator.identity();
		Member member = operator.apply(new Member("ȫ�浿", "hong"));
		System.out.println("�̸�: " + member.getName());
		System.out.println("���̵�: " + member.getId());
	}
}

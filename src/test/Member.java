package test;

public class Member {
	private String memberid;
	private String password;
	private String name;
	private String email;
	
	// jsp:useBean은 기본 생성자를 땡기도록 되어있음 
	// 그렇기 때문에 생성자를 생성할 때 기본생성자를 만들고 추가로 생성자를 만든다.
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String memberid, String password, String name, String email) {
		super();
		this.memberid = memberid;
		this.password = password;
		this.name = name;
		this.email = email;
	}

	public String getMemberid() {
		return memberid;
	}

	

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return String.format("Member [memberid=%s, password=%s, name=%s, email=%s]", memberid, password, name, email);
	}

}

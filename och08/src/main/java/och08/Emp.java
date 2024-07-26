package och08;

public class Emp {
	private int empno;
	private String ename;
	private String job;
	private int sal;
	private String hiredate;

	public int getEmpno() {
		return empno;
	}
// 세터를 막으면 오류가 난다 사번을 저장할 수 없음.
	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
}

import java.util.*;

public class J {

	static int chocolateBar[][];

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);

		while (true) {
			int friends = scn.nextInt();

			if (friends == 0) break;

			int row = scn.nextInt();
			int col = scn.nextInt();

			chocolateBar = new int[row][col];

			boolean flagPossible = true;
			Queue q = new LinkedList();

			for (int i = 0; i < friends; i++) {
				q.add(scn.nextInt());
			}

			while (!q.isEmpty()) {
				int z = (int) q.remove();
				int slice = 1;
				int x = z;
				boolean hasChoco = false, canFit=true;
				while (!hasChoco) {
					for (int r = 0; r < row; r++) {
						if (getRemCol(r) >= z) {
							canFit=true;
							takeChoco(x, r, (r + slice) - 1, getStartCol(r),
									(getStartCol(r) + z) - 1);
							hasChoco = true;
							break;
						}
						else canFit=false;
					}
					if (canFit==false) {
						slice++;
						if(z%slice==0) z/=slice;
						else exit();
					}
				}

			}
			
			for (int i=0; i<row; i++) {
				for (int j=0; j<row; j++) {
					if (chocolateBar[i][j]==0) {
						exit();
					}
				}		
			}

			System.out.println("YES");	
			/*System.out.println();
			displayChoco(row, col);
			System.out.println();*/
		}
	}

	public static void exit() {
		System.out.println("NO");
		main(new String[] {"123"});
		System.exit(0);
	}

	public static void takeChoco(int friend, int row1, int row2, int col1, int col2) {
		try {
			for (int r = row1; r <= row2; r++) {
				for (int c = col1; c <= col2; c++) {
					chocolateBar[r][c] = friend;
				}
			}
		} catch (Exception e) {
			exit();
		}
	}

	public static int getRemCol(int row) {
		return chocolateBar[row].length - getStartCol(row);
	}

	public static int getStartCol(int row) {
		int x = 0;
		for (int i = 0;i<chocolateBar[row].length;i++) {
			if (chocolateBar[row][x] != 0) {
				x++;
			}
		}
		return x;
	}

	public static void displayChoco(int row, int col) {
		for (int r = 0; r < row; r++) {
			for (int c = 0; c < col; c++) {
				System.out.print(chocolateBar[r][c]);
			}
			System.out.println();
		}
	}

}

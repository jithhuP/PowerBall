#include <iostream>

using namespace std;

void lotto_total(int total[45][3]);
void lotto_fifty(int fifty[45][3]);
void lotto_mean(int total_num[45][3]);

int main() {
	
	int lotto[45][3] = {
	{176,3,1}, {170,7,2}, {168,8,3}, {172,5,4}, {161,10,5},
	{166,12,6}, {166,8,7}, {157,3,8}, {138,6,9}, {167,5,10},
	{167,7,11}, {181,14,12}, {177,6,13}, {173,10,14}, {165,8,15}, 
	{164,6,16}, {180,9,17}, {173,6,18}, {160,8,19},{174,8,20},
	{164,5,21}, {140,11,22}, {145,6,23}, {170,8,24}, {154,6,25},
	{172,9,26}, {182,9,27}, {148,6,28}, {148,10,29}, {158,8,30}, 
	{168,9,31}, {153,12,32}, {177,9,33}, {183,9,34}, {167,13,35},
	{164,8,36}, {168,7,37}, {153,7,38}, {173,6,39}, {169,7,40}, 
	{147,7,41}, {161,6,42}, {182,2,43}, {162,7,44}, {170,14,45}
	};
	//1���� �� ��Ż Ƚ�� ��, 2���� 50Ƚ�� ��, 3���� �����ϴ� �ζ� ��ȣ�� ��Ÿ�´�.

	lotto_mean(lotto);
	lotto_total(lotto);
	lotto_fifty(lotto);
	

	return 0;
}

//�� Ƚ�� �� �������� ����
void lotto_total(int total[45][3]) {
	
	for (int i = 0; i < 45; i++)
	{
		for (int j = i + 1; j < 45; j++)
		{
			if (total[i][0] < total[j][0])
			{
				int temp;

				temp = total[i][0];
				total[i][0] = total[j][0];
				total[j][0] = temp;

				temp = total[i][2];
				total[i][2] = total[j][2];
				total[j][2] = temp;
			}
		}
		cout << "�� Ƚ�� ��������: " << total[i][0] << " ���� �ϴ� �ζ� ���ڴ�: " << total[i][2] << endl;
	}
	//������ �˰���
	for(int k = 0; k <45; k++)
	{
		for (int l = k + 1; l < 45; l++) 
		{
			if (total[k][2] > total[l][2])
			{
				int temp;

				temp = total[k][2];
				total[k][2] = total[l][2];
				total[l][2] = temp;

				temp = total[k][0];
				total[k][0] = total[l][0];
				total[l][0] = temp;
			}
		}
	}
	//�ٽ� ������ - ���� ������ ���� �����Ͱ� �����־� �������� �Լ� ��� �Ұ�
	cout << endl;
	return;
}

//50Ƚ�� �� �������� ����
void lotto_fifty(int fifty[45][3]) {
	
	for (int i = 0; i < 45; i++)
	{
		for (int j = i + 1; j < 45; j++)
		{
			if (fifty[i][1] < fifty[j][1])
			{
				int temp;

				temp = fifty[i][1];
				fifty[i][1] = fifty[j][1];
				fifty[j][1] = temp;

				temp = fifty[i][2];
				fifty[i][2] = fifty[j][2];
				fifty[j][2] = temp;
			}
		}
		cout << "�� Ƚ�� ��������: " << fifty[i][1] << " ���� �ϴ� �ζ� ���ڴ�: " << fifty[i][2] << endl;
	}

	for (int k = 0; k < 45; k++)
	{
		for (int l = k + 1; l < 45; l++)
		{
			if (fifty[k][2] > fifty[l][2])
			{
				int temp;

				temp = fifty[k][2];
				fifty[k][2] = fifty[l][2];
				fifty[l][2] = temp;

				temp = fifty[k][1];
				fifty[k][1] = fifty[l][1];
				fifty[l][1] = temp;
			}
		}
	}
	cout << endl;
	return;
}

//�� Ƚ���� 50ȸ Ƚ���� ���� 5�� ���� ���� ��հ�
void lotto_mean(int total_num[45][3]) {
	
	double mean;
	for (int j = 0; j < 2; j++) {
		for (int i = 0; i < 9; i++) {
			mean = (total_num[i][j] + total_num[i * 5 + 1][j] + total_num[i * 5 + 2][j] + total_num[i * 5 + 3][j] + total_num[i * 5 + 4][j]) / 5;
			cout << mean << endl;
		}
	}
	cout << endl;
	return;
}
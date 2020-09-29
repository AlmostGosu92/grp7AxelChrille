class EnemyBullet extends Bullet 
{
	boolean enemy;

	EnemyBullet(float x, float y, PVector in, boolean enemy)
	{
		super(x, y, in, enemy);
		this.enemy = enemy;
		bulletColor = color(255, 0, 0);
	}
}
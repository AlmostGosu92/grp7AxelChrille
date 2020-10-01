class EnemyBullet extends Bullet 
{

	EnemyBullet(float x, float y, PVector in)
	{
		super(x, y, in);
		bulletColor = color(255, 0, 0);
		position = new PVector(x, y);
		velocity = in.copy();
		velocity.mult(bulletSpeed);
		velocity.limit(maxSpeed);
		enemy = true;

	}

	/*EnemyBullet(float x, float y, PVector in, boolean enemy)
	{
		super(x, y, in, enemy);
		this.enemy = enemy;
	}*/


}
public class RPGCharacter
{
    private String name;
    private int level;
    private int hp;
    private int mana;
    private int attackCount;
    private boolean isAlive;

    public RPGCharacter(String name, int level, int hp, int mana) {
        name = name;
        level = level;
        hp = hp;
        mana = mana;
        attackCount = 0;
        isAlive = true; 
    }

    public void receiveDamage(int damage) {
        if (!isAlive) {
            System.out.println(name + " is already defeated!");
            return;
        }
        hp = hp - damage;
        if (hp <= 0) {
            hp = 0;
            isAlive = false;
            System.out.println(name + " has fallen in battle!");
        } else {
            System.out.println(name + " took " + damage + " dmg! HP left: " + hp);
        }
    }

    public void attack(RPGCharacter enemy) {
        if (!isAlive) {
            System.out.println(name + " cannot attack while defeated!");
            return; 
        }

        attackCount = attackCount + 1;
        int damage = 15 + (level * 3);

        if (attackCount % 3 == 0) {
            damage = damage * 2; 
            System.out.println(name + "CRITICAL HIT!");
        }
        enemy.receiveDamage(damage);
    }
    public void castHeal() {
        if (isAlive == true && mana >= 20) {
            mana = mana - 20;
            hp = hp + 35;
            
            if (hp > 100) {
                hp = 100;
            }
            
            System.out.println(name + " healed! HP: " + hp + ", Mana: " + mana);
        } else {
            System.out.println("Cannot heal (dead or not enough mana).");
        }
    }

    public static void main(String[] args) {
        RPGCharacter hero = new RPGCharacter("Баатар", 2, 100, 50);
        RPGCharacter monster = new RPGCharacter("Мангас", 1, 80, 20);
        System.out.println("--- ТУЛААН ЭХЭЛЛЭЭ ---");
        hero.attack(monster); 
        hero.attack(monster); 
        hero.attack(monster); 
        hero.castHeal();      
    }
}
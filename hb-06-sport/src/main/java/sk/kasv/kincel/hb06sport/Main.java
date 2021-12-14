package sk.kasv.kincel.hb06sport;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import sk.kasv.kincel.hb06sport.entity.Player;
import sk.kasv.kincel.hb06sport.entity.Sport;

public class Main {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").
                addAnnotatedClass(Player.class).
                addAnnotatedClass(Sport.class).
                buildSessionFactory();

        Session session = factory.getCurrentSession();
        int playerId=3;
        int sportId=1;
        try {
            session.beginTransaction();
            Player player1=session.get(Player.class,playerId);
            Sport sport=session.get(Sport.class, sportId);
            System.out.println(player1.toString());
            System.out.println();
            System.out.println(player1.getSportList());
            System.out.println();
            player1.removeSport(sport);

            session.getTransaction().commit();
            System.out.println("Done");
        }finally {
            factory.close();
        }

    }
}

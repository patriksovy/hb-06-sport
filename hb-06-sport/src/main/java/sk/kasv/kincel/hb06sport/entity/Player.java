package sk.kasv.kincel.hb06sport.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "player")
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @ManyToMany(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    @JoinTable(name = "player_sport",
            joinColumns = @JoinColumn(name = "playerId"),
            inverseJoinColumns = @JoinColumn(name = "sportId"))


    private List<Sport> sportList;

    public Player(){

    }

    public Player(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public List<Sport> getSportList() {
        return sportList;
    }

    public void setSportList(List<Sport> sportList) {
        this.sportList = sportList;
    }
    public void addSport(Sport sport) {
        if (sportList == null)
            sportList = new ArrayList<>();
        sportList.add(sport);
    }
    public void removeSport(Sport sport){
        if (sportList!=null && sportList.contains(sport)){
            sportList.remove(sport);
            System.out.println("sport removed");
        }else{
            System.out.println("user has no sports");
        }

    }
    @Override
    public String toString() {
        return "Player{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }
}

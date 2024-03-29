package edu.example.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class User {
    private int uid;
    private String userName;
    private String password;
    private int power;
    private int state;
    private String birthdate;
    private String phonenum;
    private int gender;

}

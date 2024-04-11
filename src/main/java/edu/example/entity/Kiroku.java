package edu.example.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * (Kiroku)实体类
 *
 * @author makejava
 * @since 2023-12-27 17:35:46
 */
@Data
@Setter
@Getter
//@AllArgsConstructor
public class Kiroku {
    private int vid;
    private int id;
    private int uid;
    private String ptime;
    private String username;
    private int lim;


}


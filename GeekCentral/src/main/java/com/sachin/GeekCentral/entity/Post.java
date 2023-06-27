package com.sachin.GeekCentral.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String heading;

    private String content;

    private String imageName;

    private Date date;

    @ManyToOne
    private Category category;

    @ManyToOne
    @JsonIgnore
    private User user;

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", heading='" + heading + '\'' +
                ", content='" + content + '\'' +
                ", imageName='" + imageName + '\'' +
                ", date=" + date +
                '}';
    }
}
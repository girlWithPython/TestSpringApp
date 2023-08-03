package com.test.app.springapp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Entity {
    private int id;
    private String name;
}

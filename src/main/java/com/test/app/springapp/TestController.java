package com.test.app.springapp;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
public class TestController {

    @GetMapping("/entity")
    public ResponseEntity<Entity> getEntity() {
        return ResponseEntity.ok(Entity.builder()
                .id(1)
                .name("name")
                .build());
    }
}

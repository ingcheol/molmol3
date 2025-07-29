package edu.sm.molshop3.dto;

import java.util.List;

public class ProductDto {
    private String id;
    private String title;
    private String description;
    private String image;
    private int price;
    private List<ItemDto> items;

    public ProductDto(String id, String title, String description, String image, int price, List<ItemDto> items) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.price = price;
        this.items = items;
    }

    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getImage() { return image; }
    public int getPrice() { return price; }
    public List<ItemDto> getItems() { return items; }
}

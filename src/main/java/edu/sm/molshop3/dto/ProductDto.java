package edu.sm.molshop3.dto;

public class ProductDto {
    private String id;
    private String title;
    private String description;
    private String image;
    private int price;

    public ProductDto(String id, String title, String description, String image, int price) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.price = price;
    }

    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getImage() { return image; }
    public int getPrice() { return price; }
}

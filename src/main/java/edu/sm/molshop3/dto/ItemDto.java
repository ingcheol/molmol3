package edu.sm.molshop3.dto;

public class ItemDto {
    private String id;
    private String name;
    private String desc;
    private int price;

    public ItemDto(String id, String name, String desc, int price) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.price = price;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getDesc() { return desc; }
    public int getPrice() { return price; }
}

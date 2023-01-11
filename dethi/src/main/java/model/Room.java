package model;
//id int primary key auto_increment,
//        ma_mb varchar(45),
//        `area` double,
//        room_status_id int ,
//        `floor` int ,
//        room_type_id int ,
//        describer longtext,
//        price double ,
//        begin_date date,
//        end_date date,
//        foreign key(room_status_id) references room_status(id),
//        foreign key(room_type_id) references room_type(id)
public class Room {
     private int id ;
     private  String maMB;
     private  double area ;
     private  RoomStatus roomStatus ;
     private  int floor ;
     private  RoomType roomType ;
     private String describer ;
     private double price;
     private String beginDate;
     private String endDate;

    public Room(int id, String maMB, double area, RoomStatus roomStatus, int floor, RoomType roomType, String describer, double price, String beginDate, String endDate) {
        this.id = id;
        this.maMB = maMB;
        this.area = area;
        this.roomStatus = roomStatus;
        this.floor = floor;
        this.roomType = roomType;
        this.describer = describer;
        this.price = price;
        this.beginDate = beginDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaMB() {
        return maMB;
    }

    public void setMaMB(String maMB) {
        this.maMB = maMB;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public RoomStatus getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(RoomStatus roomStatus) {
        this.roomStatus = roomStatus;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public String getDescriber() {
        return describer;
    }

    public void setDescriber(String describer) {
        this.describer = describer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}

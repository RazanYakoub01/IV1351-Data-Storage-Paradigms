/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.model;

/**
 * @author Razan Yakoub, Seema Bashir, Teoman Köylüoglu
 *
 */
public class Instrument implements InstrumentDTO {
    private int instrumentId;
    private int stockId;
    private String instrumentName;
    private String brand;
    private int rentingPrice;
    private String availableStock;

    public Instrument(int instrumentId, int stockId, String instrumentName, String brand, int rentingPrice,
            String availableStock) {
        this.instrumentId = instrumentId;
        this.stockId = stockId;
        this.instrumentName = instrumentName;
        this.brand = brand;
        this.rentingPrice = rentingPrice;
        this.availableStock = availableStock;
    }

    public int getInstrumentID() {
        return instrumentId;
    }

    public int getStockID() {
        return stockId;
    }

    public String getInstrumentName() {
        return instrumentName;
    }

    public String getInstrumentBrand() {
        return brand;
    }

    public int getInstrumentRentingPrice() {
        return rentingPrice;
    }

    public String getInstrumentAvailableStock() {
        return availableStock;
    }

    public void decrementAvailableStock() {
        int stock = Integer.parseInt(availableStock);
        stock--;
        this.availableStock = Integer.toString(stock);
    }

    public void incrementAvailableStock() {
        int stock = Integer.parseInt(availableStock);
        stock++;
        this.availableStock = Integer.toString(stock);
    }

    @Override
    public String toString() {
        return "Available Instrument {" +
                "instrumentId=" + instrumentId +
                ", instrumentName='" + instrumentName + '\'' +
                ", brand='" + brand + '\'' +
                ", rentingPrice=" + rentingPrice +
                ", availableStock='" + availableStock + '\'' +
                '}';
    }

}

package articventas;

import java.util.Set;


public class Articulos {
	private int codarti;
	private String denom; 
	private int stock; 
	private float pvp;
	
	private Set<Ventas> Compras;
	
	public Articulos(int codarti, String denom, int stock, float pvp, Set<Ventas> compras) {
		super();
		this.codarti = codarti;
		this.denom = denom;
		this.stock = stock;
		this.pvp = pvp;
		Compras = compras;
	}
	
	
	public Articulos(){}
	
	public Articulos(int codarti, String denom, int stock, float pvp) {
		super();
		this.codarti = codarti;
		this.denom = denom;
		this.stock = stock;
		this.pvp = pvp;
	}
	public int getCodarti() {
		return codarti;
	}
	public void setCodarti(int codarti) {
		this.codarti = codarti;
	}
	public String getDenom() {
		return denom;
	}
	public void setDenom(String denom) {
		this.denom = denom;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public float getPvp() {
		return pvp;
	}
	public void setPvp(float pvp) {
		this.pvp = pvp;
	}


	public Set<Ventas> getCompras() {
		return Compras;
	}


	public void setCompras(Set<Ventas> compras) {
		Compras = compras;
	} 

}



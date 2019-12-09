package ModeloVO;

public class UbicacionVO {

    int nivel, profundidad, cod_cu;
    String estante;

    public UbicacionVO(int nivel, int profundidad, int cod_cu, String estante) {
        this.nivel = nivel;
        this.profundidad = profundidad;
        this.cod_cu = cod_cu;
        this.estante = estante;
    }

    public UbicacionVO() {
    }

    public int getCod_cu() {
        return cod_cu;
    }

    public void setCod_cu(int cod_cu) {
        this.cod_cu = cod_cu;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getProfundidad() {
        return profundidad;
    }

    public void setProfundidad(int profundidad) {
        this.profundidad = profundidad;
    }

    public String getEstante() {
        return estante;
    }

    public void setEstante(String estante) {
        this.estante = estante;
    }

}

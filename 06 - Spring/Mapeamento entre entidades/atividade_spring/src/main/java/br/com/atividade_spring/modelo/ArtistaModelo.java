package br.com.atividade_spring.modelo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "artistas")
public class ArtistaModelo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String nome;

    @OneToMany
    @JoinColumn(name = "codigo_artista")
    private List<MusicaModelo> musicas;


    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<MusicaModelo> getMusicas() {
        return this.musicas;
    }

    public void setMusicas(List<MusicaModelo> musicas) {
        this.musicas = musicas;
    }


}

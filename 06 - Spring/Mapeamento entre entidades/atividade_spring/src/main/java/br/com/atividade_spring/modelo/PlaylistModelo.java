package br.com.atividade_spring.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "playlists")
public class PlaylistModelo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String nome;

    @ManyToMany
    @JoinTable(
        name = "tabela_auxiliar",
        joinColumns = {@JoinColumn(name = "codigo_playlist", referencedColumnName = "codigo")},
        inverseJoinColumns = {@JoinColumn(name = "codigo_musica", referencedColumnName = "codigo")}
    )
    private List<MusicaModelo> musicas = new ArrayList<>();



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

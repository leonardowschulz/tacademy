package br.com.atividade_spring.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade_spring.modelo.ArtistaModelo;
import br.com.atividade_spring.modelo.MusicaModelo;
import br.com.atividade_spring.repositorio.ArtistaRepositorio;

@RestController
@RequestMapping("/artistas")
public class ArtistaControle {
    
    @Autowired
    private ArtistaRepositorio acao;

    @PostMapping("")
    public ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<ArtistaModelo> selecionar() {
        return acao.findAll();
    }

    @PutMapping("/{codigoArtista}")
    public ArtistaModelo alterar( @PathVariable long codigoArtista, @RequestBody MusicaModelo obj){

        ArtistaModelo am = acao.findByCodigo(codigoArtista);
       
        am.getMusicas().add(obj);

        acao.save(am);

        return am;

    }

}

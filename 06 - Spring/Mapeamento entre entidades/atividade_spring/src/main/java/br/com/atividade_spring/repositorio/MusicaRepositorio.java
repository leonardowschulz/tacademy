package br.com.atividade_spring.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.atividade_spring.modelo.MusicaModelo;

@Repository
public interface MusicaRepositorio extends CrudRepository<MusicaModelo, Long> {
    
}

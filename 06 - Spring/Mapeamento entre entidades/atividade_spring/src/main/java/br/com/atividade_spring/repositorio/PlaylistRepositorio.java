package br.com.atividade_spring.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.atividade_spring.modelo.PlaylistModelo;

@Repository
public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long> {
    
}

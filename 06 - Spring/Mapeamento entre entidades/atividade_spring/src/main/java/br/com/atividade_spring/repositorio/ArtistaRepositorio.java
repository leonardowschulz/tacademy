package br.com.atividade_spring.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.atividade_spring.modelo.ArtistaModelo;

@Repository
public interface ArtistaRepositorio extends CrudRepository<ArtistaModelo, Long> {
    
    ArtistaModelo findByCodigo(long codigo);

}

package com.itdel.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.itdel.model.Laporan;

@Repository("pagingRepository")
public interface PagingRepository extends PagingAndSortingRepository<Laporan, Long>
{
	
}
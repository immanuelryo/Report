package com.itdel.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itdel.model.Laporan;
import com.itdel.model.Role;
import com.itdel.repository.LaporanRepository;
import com.itdel.repository.PagingRepository;


@Service("laporanService")
public class LaporanServiceImpl implements LaporanService{
	
	@Autowired
	LaporanRepository laporanRepository;
	
	@Autowired
	PagingRepository pagingRepository;


	@Override
	public Laporan getLaporan(int id_Laporan) {
		return laporanRepository.findOne(id_Laporan);
	}

	@Override
	public List<Laporan> getAllLaporan() {
		return laporanRepository.findAll();
	}

	@Override
	public void saveLaporan(Laporan laporan) {
		laporanRepository.save(laporan);
	}

	@Override
	public void deletelaporan(Laporan laporan) {
		laporanRepository.delete(laporan);
	}

	@Override
	public List<Laporan> getAllLaporanByRole(Set<Role> roles) {
		
		List<Laporan> listLaporan =  new ArrayList<>();
		Role[] listRole = new Role[roles.size()];
		String roleTemp = "";
		roles.toArray(listRole);
		for(Role role : listRole)
			roleTemp+=(role.getRole());
		if(roleTemp.contains("ADMIN") || roleTemp.contains("MANAGER"))
		listLaporan = getAllLaporan();
		else
		{
			if(roleTemp.contains("DEVELOPER"))
				return listLaporan = laporanRepository.getLaporanByRole("DEVELOPER");
			else if(roleTemp.contains("TECHNICAL"))
				return listLaporan = laporanRepository.getLaporanByRole("TECHNICAL");
		}
		return listLaporan;
		
	}

	@Override	
	public List<Laporan> splitMultiplePhoto() {
		return laporanRepository.findAll();
	}

	@Override
	public List<Laporan> findJudul(String nama) {
		nama = "%"+nama+"%";
		return laporanRepository.getLaporanByJudul(nama);
	}

}
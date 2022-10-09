package com.springmvc.boot.amplicomm.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.springmvc.boot.amplicomm.dao.AddressesRepository;
import com.springmvc.boot.amplicomm.dao.UserRepository;
import com.springmvc.boot.amplicomm.model.Addresses;
import com.springmvc.boot.amplicomm.model.User;

@Controller
public class HomeController {

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private AddressesRepository addressRepo;

	@RequestMapping("/")
	public String home() {
		return "index";
	}

	@PostMapping("signup")
	@ResponseBody
	public User signupRest(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("username") String username, @RequestParam("address") String address) {
		User user = null;
		try {
			if (!name.equals("") && !password.equals("") && !address.equals("") && !username.equals("")) {
				user = new User(name.trim(), username.trim(), password.trim());
				user = userRepo.save(user);

				if (user != null) {
					System.out.println("user saved");
					List<Addresses> add = addressRepo.find(user.getUid(), address);
					if (add.isEmpty()) {
						addressRepo.save(new Addresses(user.getUid(), address));
					}
				} else {
					return null;
				}
			}
		} catch (Exception ex) {

			return null;
		}
		return user;
	}

	@PostMapping("addAddress")
	@ResponseBody
	public User addAddress(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("address") String address) {
		User user = userRepo.find(username, password);
		if (user != null) {
			List<Addresses> add = addressRepo.find(user.getUid(), address);
			if (add.isEmpty()) {
				addressRepo.save(new Addresses(user.getUid(), address));
			} else {
				return null;
			}
		}
		return user;
	}

	@PostMapping("searchAddressesByUsername")
	@ResponseBody
	public List<String> searchAddressesByUsername(@RequestParam("username") String username,
			@RequestParam("password") String password) {
		User user = userRepo.find(username, password);
		List<String> addressesList = null;
		if (user != null) {
			addressesList = addressRepo.addressesByUid(user.getUid());
		}
		return addressesList;
	}

}

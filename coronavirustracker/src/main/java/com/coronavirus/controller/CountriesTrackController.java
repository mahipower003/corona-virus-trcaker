package com.coronavirus.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import org.json.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.coronavirustarcker.model.CountryInfoModel;
import com.coronavirustarcker.model.CountryModel;
import com.coronavirustarcker.model.StatewiseInfoModel;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class CountriesTrackController {

	private static final String countriesApiurl = "https://disease.sh/v3/covid-19/countries";
	private static final String IndiaApiurl = "https://api.rootnet.in/covid19-in/stats/latest";

	@RequestMapping("/")
	public ModelAndView returnCountriesdata() throws IOException, InterruptedException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("countriestracker");

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(countriesApiurl)).build();
		List<CountryModel> lstlist = new ArrayList<>();
		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
		String reponse = response.body();
		ObjectMapper mapper = new ObjectMapper();
		try {
			lstlist = mapper.readValue(reponse, List.class);

		} catch (IOException e) {
			e.printStackTrace();
		}

		mv.addObject("lstcountrylst", lstlist);
		mv.addObject("list_size", lstlist.size());

		request = HttpRequest.newBuilder().uri(URI.create(IndiaApiurl)).build();
		response = client.send(request, HttpResponse.BodyHandlers.ofString());

		reponse = response.body();

		mapper = new ObjectMapper();
		JsonNode actualObj = mapper.readTree(reponse);

		JsonNode statewiseApiNodeData = actualObj.get("data").get("regional");

		List<StatewiseInfoModel> lstStatewiseInfoModel = new ArrayList<>();

		if (statewiseApiNodeData.isArray()) {
			for (JsonNode node : statewiseApiNodeData) {
				StatewiseInfoModel statewiseinforobj = new StatewiseInfoModel();
				String loc=node.get("loc").toString();
						loc=loc.replaceAll("(['\"])", ""); 
				statewiseinforobj.setLoc(loc);
				statewiseinforobj.setConfirmedCasesIndian(node.get("confirmedCasesIndian").asInt());
				statewiseinforobj.setConfirmedCasesForeign(node.get("confirmedCasesForeign").asInt());
				statewiseinforobj.setDischarged(node.get("discharged").asInt());
				statewiseinforobj.setDeaths(node.get("deaths").asInt());
				statewiseinforobj.setTotalConfirmed(node.get("totalConfirmed").asInt());
				statewiseinforobj.setIso2(getstateiso2mapS(loc));
				lstStatewiseInfoModel.add(statewiseinforobj);
			}
		}

		mv.addObject("lstIndialst", lstStatewiseInfoModel);
		mv.addObject("listIndia_size", lstStatewiseInfoModel.size());
		
		return mv;
	}

	private String getstateiso2mapS(String statename) {
		switch (statename) {
		case "Andaman and Nicobar Islands":
			return "IN-AN";
		case "Andhra Pradesh":
			return "IN-AP";
		case "Arunachal Pradesh":
			return "IN-AR";
		case "Assam":
			return "IN-AS";
		case "Bihar":
			return "IN-BR";
		case "Chandigarh":
			return "IN-CH";
		case "Chhattisgarh":
			return "IN-CT";
		case "Dadra and Nagar Haveli and Daman and Diu":
			return "IN-DN";
		case "Delhi":
			return "IN-DL";
		case "Goa":
			return "IN-GA";
		case "Gujarat":
			return "IN-GJ";
		case "Haryana":
			return "IN-HR";
		case "Himachal Pradesh":
			return "IN-HP";
		case "Jammu and Kashmir":
			return "IN-JK";
		case "Jharkhand":
			return "IN-JH";
		case "Karnataka":
			return "IN-KA";
		case "Kerala***":
			return "IN-KL";
		case "Madhya Pradesh":
			return "IN-MP";
		case "Maharashtra":
			return "IN-MH";
		case "Manipur":
			return "IN-MN";
		case "Meghalaya":
			return "IN-ML";
		case "Mizoram":
			return "IN-MZ";
		case "Nagaland":
			return "IN-NL";
		case "Puducherry":
			return "IN-PY";
		case "Punjab":
			return "IN-PB";
		case "Rajasthan":
			return "IN-RJ";
		case "Sikkim":
			return "IN-SK";
		case "Tamil Nadu":
			return "IN-TN";
		case "Tripura":
			return "IN-TR";
		case "Uttar Pradesh":
			return "IN-UP";
		case "West Bengal":
			return "IN-WB";
		case "Uttarakhand":
			return "IN-UT";
		case "Ladakh":
			return "IN-OR";
			}

		return "";
	}
}

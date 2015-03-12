/*package com.infotop.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infotop.travelplatform.buy.mall.entity.Mall;
import com.infotop.travelplatform.buy.mall.service.MallService;
import com.infotop.travelplatform.buy.specialBuy.entity.SpecialBuy;
import com.infotop.travelplatform.buy.specialBuy.service.SpecialBuyService;
import com.infotop.travelplatform.food.restaurantfood.entity.Restaurantfood;
import com.infotop.travelplatform.food.restaurantfood.service.RestaurantfoodService;
import com.infotop.travelplatform.food.specialtyfood.entity.Specialfood;
import com.infotop.travelplatform.food.specialtyfood.service.SpecialfoodService;
import com.infotop.travelplatform.introductionnote.entity.IntroductionNote;
import com.infotop.travelplatform.introductionnote.service.IntroductionNoteService;
import com.infotop.travelplatform.localtransport.entity.LocalTransport;
import com.infotop.travelplatform.localtransport.service.LocalTransportService;
import com.infotop.travelplatform.popularplace.entity.PopularPlace;
import com.infotop.travelplatform.popularplace.service.PopularPlaceService;
import com.infotop.travelplatform.traffic.entity.Traffic;
import com.infotop.travelplatform.traffic.service.TrafficService;
import com.infotop.travelplatform.travelnote.entity.TravelNote;
import com.infotop.travelplatform.travelnote.service.TravelNoteService;


@RestController
public class RestDataController {
	
	@Autowired
	private IntroductionNoteService introductionNoteService;
	@Autowired
	private TravelNoteService travelNoteService;
	@Autowired
	private TrafficService trafficService;
	@Autowired
	private MallService mallService;
	@Autowired
	private SpecialBuyService specialBuyService;
	@Autowired
	private LocalTransportService localTransportService;
	@Autowired
	private PopularPlaceService popularPlaceService;
	@Autowired
	private RestaurantfoodService restaurantfoodService;
	@Autowired
	private SpecialfoodService specialfoodService;
	
	
	@RequestMapping(value = "introductionNoteapp", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<IntroductionNote> introductionNoteapp() {
		
		List<IntroductionNote> introductionList= introductionNoteService.getAllIntroduction();
		return introductionList;
	}
	
	@RequestMapping(value="travelNoteapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<TravelNote>  travelNoteapp(){
		List<TravelNote> travelNoteList = travelNoteService.getAllTravelNote();
		return travelNoteList;
	}
	
	@RequestMapping(value="trafficModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<Traffic>  trafficModuleapp(){
		List<Traffic> trafficList = trafficService.getAllTraffic();
		return trafficList;
	}
	
	@RequestMapping(value="mallModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<Mall>  mallModuleapp(){
		List<Mall> mallList = mallService.getAllMall();
		return mallList;
	}
	@RequestMapping(value="specialBuyModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<SpecialBuy>  specialBuyModuleapp(){
		List<SpecialBuy> specialBuyItemList = specialBuyService.getAllspecialBuyItems();
		return specialBuyItemList;
	}
	
	@RequestMapping(value="localTransportModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<LocalTransport>  localTransportModuleapp(){
		List<LocalTransport> localTransportList = localTransportService.getAllLocalTransport();
		return localTransportList;
	}
	
	@RequestMapping(value="popularPlaceModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<PopularPlace>  popularPlaceModuleapp(){
		List<PopularPlace> popularPlaceList = popularPlaceService.getAllPopularPlace();
		return popularPlaceList;
	}
	
	@RequestMapping(value="restaurantfoodModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<Restaurantfood>  restaurantfoodModuleapp(){
		List<Restaurantfood> restaurantfoodList = restaurantfoodService.getAllRestaurantfood();
		return restaurantfoodList;
	}
	@RequestMapping(value="specialfoodModuleapp",method =RequestMethod.GET, produces="application/json")
	public @ResponseBody List<Specialfood>  specialfoodModuleapp(){
		List<Specialfood> specialfoodList = specialfoodService.getAllSpecialFood();
		return  specialfoodList;

	}
	
	
	@Autowired
	private DeviceService deviceService;

	@Autowired
	private TbdevicestateService deviceStateService;

	@Autowired
	private TbmoduleService moduleService;

	@Autowired
	private TbcommandService commandService;

	@RequestMapping(value = "devicesList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Device> devicesListPage() {
		List<Device> devices = deviceService.getAllDevices();
		return devices;
	}

	@RequestMapping(value = "deviceList/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List devicesListbyId(@PathVariable("id") Long id,
			Model model) {
		Device device = deviceService.get(id);
		Tbdevicestate deviceState = deviceStateService.getAlldevStateById(id);
		List<Tbmodule> module = moduleService.getAllmoduleById(id);
		List list = new ArrayList();
		list.add(deviceState);
		list.add(module);
		list.add(device);
		return list;
	}

	@RequestMapping(value = "statusUpdate", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public String parameterCommandupdate(@RequestBody Tbcommand tbcommand,
			Model model, RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		//JSONObject jb = new JSONObject(request.getParameter(arg0));
		Device device = deviceService.get(Long.valueOf(tbcommand.getId()));
		// Tbcommand tbcommand1 = commandService.get(tbcommand.getId());
		System.out.println("---------tbcommand---------"
				+ tbcommand.getCommand());
		//tbcommand.setUuid(device.getUuid());
		tbcommand.setDevice(device);
		tbcommand.setFlag("0");
		tbcommand.setCommand(tbcommand.getCommand());
		tbcommand.setCreateDate(getDateTime());
		tbcommand.setCreateUser("mobile");
		System.out.println("tbcommand obje" + tbcommand);
		try {
			commandService.save(tbcommand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Success";
	}

	public String getDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return sdf.format(date);

	}
}
*/
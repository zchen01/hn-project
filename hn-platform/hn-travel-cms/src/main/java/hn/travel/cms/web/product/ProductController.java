package hn.travel.cms.web.product;

import hn.travel.cms.generic.web.GenericController;
import hn.travel.persist.entity.product.Product;
import hn.travel.persist.service.product.ProductService;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.ecside.util.RequestUtil;
import org.extremecomponents.table.limit.Limit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;



@Controller
@RequestMapping(value = "/product")
public class ProductController extends GenericController{
	private static final String PAGE_SIZE = "3";
	
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("createTime", "时间");
	}
	
	@Autowired
	private ProductService productService;
	
	
	
	@RequestMapping(value = "list")
	public String list(Product product, HttpServletRequest request, Model model) {
		model.addAttribute("product", product);
		int pageSize = getParam(request, "ec_rd", 13);
		int pageNo = getParam(request, "ec_p", 1);
		/*获取总记录数*/
		int totalRows = (int)productService.queryCount(product);
		String tableId = RequestUtil.getTableId(request);
		Limit limit = RequestUtil.getLimit(request, tableId, totalRows, pageSize);
		limit.setRowAttributes(totalRows, pageSize);
		org.extremecomponents.table.limit.Sort sort = limit.getSort();
		String sortKey = sort.getProperty();
		String sortValue = sort.getSortOrder();
		Pageable pageable = null;
		if(StringUtils.hasText(sortKey)) {
			if("desc".equals(sortValue)) 
				pageable = new PageRequest((pageNo-1), pageSize, new Sort(Direction.DESC, sortKey));
			else 
				pageable = new PageRequest((pageNo-1), pageSize, new Sort(Direction.ASC, sortKey));
		} else {
			pageable = new PageRequest((pageNo-1), pageSize, new Sort(Direction.DESC, "createTime"));
		}
		Page<Product> page = productService.queryList(product, pageable);
		model.addAttribute("productList", page.getContent());
		return "product/productList";
	}
	
	
	@RequestMapping(value = "listPage",method = RequestMethod.GET)
	public String listPage(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<Product> productListPage = productService.queryProductListPage(searchParams, pageNumber, pageSize, sortType);
		model.addAttribute("productListPage", productListPage);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		
		return "product/productList";
	}

	@RequestMapping(value = "toAdd", method = RequestMethod.GET)
	public String toAdd(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("action", "create");
		return "product/productAdd";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid Product product, RedirectAttributes redirectAttributes) {
		productService.save(product);
		redirectAttributes.addFlashAttribute("message", "创建任务成功");
		return "redirect:/product/list";
	}

	@RequestMapping(value = "toUpdate/{id}", method = RequestMethod.GET)
	public String toUpdate(@PathVariable("id") Long id, Model model) {
		Product product=productService.getEntity(id);
		model.addAttribute("product", product);
		model.addAttribute("action", "update");
		return "product/productUpdate";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
		productService.save(product);
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/product/list?id=2";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		productService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/product/list";
	}
	
	
	@RequestMapping(value = "getById/{id}", method = RequestMethod.GET)
	public String getById(@PathVariable("id") Long id, Model model) {
		Product product=productService.getEntity(id);
		model.addAttribute("product", product);
		return "product/product";
	}
}
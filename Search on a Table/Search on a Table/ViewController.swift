//
//  ViewController.swift
//  Search on a Table
//
//  Created by AL Mustakim on 20/5/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
 
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    let arr = ["Bangladesh","India","Maldivs","Albania"]
    
    let country = ["Afghanistan"
    , "Albania"
    ,    "Algeria"
    ,    "Andorra"
    ,    "Angola"
    ,    "Antigua and Barbuda"
    ,    "Argentina"
    ,   "Armenia"
    ,    "Australia"
    ,    "Austria"
    ,    "Azerbaijan"
    ,    "Bahamas"
    ,    "Bahrain"
    ,    "Bangladesh"
    ,    "Barbados"
    ,    "Belarus"
    ,    "Belgium"
    ,    "Belize"
    ,    "Benin"
    ,    "Bhutan"
    ,    "Bolivia"
    ,    "Bosnia and Herzegovina"
    ,    "Botswana"
    ,    "Brazil"
    ,    "Brunei"
    ,    "Bulgaria"
    ,    "Burkina Faso"
    ,    "Burundi"
    ,    "Côte d'Ivoire"
    ,    "Cabo Verde"
    ,    "Cambodia"
    ,    "Cameroon"
    ,    "Canada"
    ,    "Central African Republic"
    ,    "Chad"
    ,    "Chile"
    ,    "China"
    ,    "Colombia"
    ,    "Comoros"
    ,    "Congo (Congo-Brazzaville)"
    ,    "Costa Rica "
    ,    "Croatia"
    ,    "Cuba"
    ,    "Cyprus"
    ,    "Czechia"
    ,    "Democratic Republic of the Congo"
    ,    "Denmark"
    ,    "Djibouti"
    ,    "Dominica"
    ,    "Dominican Republic"
    ,    "Ecuador"
    ,    "Egypt"
    ,    "El Salvador"
    ,    "Equatorial Guinea"
    ,    "Eritrea"
    ,    "Estonia"
    ,    "Eswatini (fmr. Swaziland"
    ,    "Ethiopia"
    ,    "Fiji"
    ,    "Finland"
    ,    "France"
    ,    "Gabon"
    ,    "Gambia"
    ,    "Georgia"
    ,    "Germany"
    ,    "Ghana"
    ,    "Greece"
    ,    "Grenada"
    ,    "Guatemala"
    ,    "Guinea"
    ,    "Guinea-Bissau "
    ,    "Guyana"
    ,    "Haiti"
    ,    "Holy See"
    ,    "Honduras"
    ,    "Hungary"
    ,    "Iceland"
    ,    "India"
    ,    "Indonesia"
    ,    "Iran"
    ,    "Iraq"
    ,    "Ireland"
    ,    "Israel"
    ,    "Italy"
    ,    "Jamaica"
    ,    "Japan"
    ,    "Jordan"
    ,    "Kazakhstan"
    ,    "Kenya"
    ,    "Kiribati"
    ,    "Kuwait"
    ,    "Kyrgyzstan"
    ,    "Laos"
    ,    "Latvia"
    ,    "Lebanon"
    ,    "Lesotho"
    ,    "Liberia"
    ,    "Libya"
    ,    "Liechtenstein"
    ,    "Lithuania"
    ,    "Luxembourg"
    ,    "Madagascar"
    ,    "Malawi"
    ,    "Malaysia"
    ,    "Maldives"
    ,    "Mali"
    ,    "Malta"
    ,    "Marshall Islands"
    ,    "Mauritania"
    ,    "Mauritius"
    ,    "Mexico"
    ,    "Micronesia"
    ,    "Moldova"
    ,    "Monaco"
    ,    "Mongolia"
    ,    "Montenegro"
    ,    "Morocco"
    ,    "Mozambique"
    ,    "Myanmar"
    ,    "Namibia"
    ,    "Nauru"
    ,    "Nepal"
    ,    "Netherlands"
    ,    "New Zealand "
    ,    "Nicaragua"
    ,    "Niger"
    ,    "Nigeria"
    ,    "North Korea "
    ,    "North Macedonia"
    ,    "Norway"
    ,    "Oman"
    ,    "Pakistan"
    ,    "Palau"
    ,    "Palestine State"
    ,    "Panama"
    ,    "Papua New Guinea"
    ,    "Paraguay"
    ,    "Peru"
    ,    "Philippines"
    ,    "Poland"
    ,    "Portugal"
    ,    "Qatar"
    ,    "Romania"
    ,    "Russia"
    ,    "Rwanda"
    ,    "Saint Kitts and Nevis"
    ,    "Saint Lucia"
    ,    "Saint Vincent and the Grenadines"
    ,    "Samoa"
    ,    "San Marino"
    ,    "Sao Tome and Principe"
    ,    "Saudi Arabia"
    ,    "Senegal"
    ,    "Serbia"
    ,    "Seychelles"
    ,    "Sierra Leone"
    ,    "Singapore"
    ,    "Slovakia"
    ,    "Slovenia"
    ,    "Solomon Islands"
    ,    "Somalia"
    ,    "South Africa"
    ,    "South Korea"
    ,    "South Sudan"
    ,    "Spain"
    ,    "Sri Lanka"
    ,    "Sudan"
    ,    "Suriname"
    ,    "Sweden"
    ,    "Switzerland"
    ,    "Syria"
    ,    "Tajikistan"
    ,    "Tanzania"
    ,    "Thailand"
    ,    "Timor-Leste"
    ,    "Togo"
    ,    "Tonga"
    ,    "Trinidad and Tobago"
    ,    "Tunisia"
    ,    "Turkey"
    ,    "Turkmenistan"
    ,    "Tuvalu"
    ,    "Uganda"
    ,    "Ukraine"
    ,    "United Arab Emirates"
    ,    "United Kingdom"
    ,    "United States of America "
    ,    "Uruguay"
    ,    "Uzbekistan"
    ,    "Vanuatu"
    ,    "Venezuela"
    ,    "Vietnam"
    ,    "Yemen"
    ,    "Zambia"
    ,    "Zimbabwe"]
    
    var searchCountry = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchCountry.count
        }
        else{
            return country.count
        }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if searching == true{
            cell.countryName.text = searchCountry[indexPath.row]
            
        }
        else{
            cell.countryName.text = country[indexPath.row]
        }
        return cell
     }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = country.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
      //  searchCountry = country.filter({$0.lowercased().suffix(searchText.count) == searchText.lowercased()})
        searching = true
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tblView.reloadData()
    }
     

    
    
}


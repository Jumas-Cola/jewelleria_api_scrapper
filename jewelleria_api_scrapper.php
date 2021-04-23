<?php

function get_api_data($url, $token) {
    $curl = curl_init();
    curl_setopt_array($curl, array(
      CURLOPT_URL => $url,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_TIMEOUT => 3000,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "GET",
      CURLOPT_HTTPHEADER => array(
        "Authorization: $token"
      ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);
    curl_close($curl);

    return json_decode($response, true);
}

function query($sql, $link) {
    if(mysqli_query($link, $sql)){
        echo "Records inserted successfully.\n";
    } else{
        echo "ERROR: Could not able to execute $sql. \n" . mysqli_error($link);
    }
}


$TOKEN = "";

#######################
# Выгрузка комплектов #
#######################

$link = mysqli_connect("127.0.0.1", "root", "root", "jewelleria");

$json = get_api_data("https://api.hsr24.ru:8443/v1/nomenclature/bundles", $TOKEN);

foreach ($json['data'] as $key => $value) {
    $data = $value;
    $code = $data["code"];
    $type = $data["type"];
    $name = $data["name"];
    $description = $data["description"];
    $feature = $data["feature"];
    $certificate = $data["certificate"];
    $price = $data["price"];
    $oldprice = $data["oldprice"];
    $category = $data["category"];
    $subcategory = $data["subcategory"];
    $photos = json_encode($data["photos"]);
    $composition = json_encode($data["composition"]);

    $sql = "REPLACE INTO bundles (code, type, name, description, feature, 
        certificate, price, oldprice, category, subcategory, photos, composition) 
        VALUES ('$code', '$type', '$name', '$description', '$feature', '$certificate', 
        '$price', '$oldprice', '$category', '$subcategory', '$photos', '$composition')";
    query($sql, $link);
}

mysqli_close($link);

echo "Комплекты выгружены!\n";



####################
# Выгрузка товаров #
####################

$link = mysqli_connect("127.0.0.1", "root", "root", "jewelleria");

$json = get_api_data("https://api.hsr24.ru:8443/v1/nomenclature/all", $TOKEN);

foreach ($json['data'] as $key => $value) {
    $data = $value;
    $code = $data["code"];
    $type = $data["type"];
    $name = $data["name"];
    $description = $data["description"];
    $feature = $data["feature"];
    $certificate = $data["certificate"];
    $price = $data["price"];
    $oldprice = $data["oldprice"];
    $category = $data["category"];
    $subcategory = $data["subcategory"];

    $brand = $data["brand"];
    $country = $data["country"];
    $size = $data["size"];
    $metall = $data["metall"];
    $fineness = $data["fineness"];
    $covering = $data["covering"];

    $photos = json_encode($data["photos"]);
    $inserts = json_encode($data["inserts"], JSON_UNESCAPED_UNICODE);
    $tags = json_encode($data["tags"], JSON_UNESCAPED_UNICODE);

    $sql = "REPLACE INTO all_products (code, type, name, description, 
        feature, certificate, price, oldprice, category, 
        subcategory, brand, country, size, metall, fineness, 
        covering, photos, inserts, tags) 
        VALUES ('$code', '$type', '$name', '$description', 
        '$feature', '$certificate', '$price', '$oldprice', 
        '$category', '$subcategory', '$brand', '$country', 
        '$size', '$metall', '$fineness', '$covering', '$photos', 
        '$inserts', '$tags')";


    query($sql, $link);
}

mysqli_close($link);

echo "Товары выгружены!\n";

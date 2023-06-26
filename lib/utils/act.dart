// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  List<PostFeed> feed;
  PostSeo seo;

  Post({
    required this.feed,
    required this.seo,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        feed:
            List<PostFeed>.from(json["feed"].map((x) => PostFeed.fromJson(x))),
        seo: PostSeo.fromJson(json["seo"]),
      );

  Map<String, dynamic> toJson() => {
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
        "seo": seo.toJson(),
      };
}

class PostFeed {
  FluffySeo? seo;
  String trackingId;
  Locale? locale;
  PurpleContent content;
  FeedType type;
  List<RecipeType>? recipeType;
  bool? proRecipe;
  FluffyDisplay display;
  bool promoted;

  PostFeed({
    this.seo,
    required this.trackingId,
    this.locale,
    required this.content,
    required this.type,
    this.recipeType,
    this.proRecipe,
    required this.display,
    required this.promoted,
  });

  factory PostFeed.fromJson(Map<String, dynamic> json) => PostFeed(
        seo: json["seo"] == null ? null : FluffySeo.fromJson(json["seo"]),
        trackingId: json["tracking-id"],
        locale: localeValues.map[json["locale"]] ?? null,
        content: PurpleContent.fromJson(json["content"]),
        type: feedTypeValues.map[json["type"]]!,
        recipeType: json["recipeType"] == null
            ? []
            : List<RecipeType>.from(
                json["recipeType"]!.map((x) => recipeTypeValues.map[x]!)),
        proRecipe: json["proRecipe"],
        display: FluffyDisplay.fromJson(json["display"]),
        promoted: json["promoted"],
      );

  Map<String, dynamic> toJson() => {
        "seo": seo?.toJson(),
        "tracking-id": trackingId,
        "locale": localeValues.reverse[locale],
        "content": content.toJson(),
        "type": feedTypeValues.reverse[type],
        "recipeType": recipeType == null
            ? []
            : List<dynamic>.from(
                recipeType!.map((x) => recipeTypeValues.reverse[x])),
        "proRecipe": proRecipe,
        "display": display.toJson(),
        "promoted": promoted,
      };
}

class PurpleContent {
  Description? description;
  List<dynamic>? urbSubmitters;
  FluffyTags? tags;
  List<String>? preparationSteps;
  MoreContent? moreContent;
  TagsAds? tagsAds;
  Details? details;
  MoreContent? relatedContent;
  List<IngredientLine>? ingredientLines;
  UnitSystem? unitSystem;
  Reviews? reviews;
  MoreContent? relatedProducts;
  int? preparationStepCount;
  Nutrition? nutrition;
  Yums? yums;
  String? ctaUrl;
  String? platformName;
  List<dynamic>? collections;
  Videos? videos;
  Search? search;
  int? total;
  Matches? matches;
  int? start;
  int? end;

  PurpleContent({
    this.description,
    this.urbSubmitters,
    this.tags,
    this.preparationSteps,
    this.moreContent,
    this.tagsAds,
    this.details,
    this.relatedContent,
    this.ingredientLines,
    this.unitSystem,
    this.reviews,
    this.relatedProducts,
    this.preparationStepCount,
    this.nutrition,
    this.yums,
    this.ctaUrl,
    this.platformName,
    this.collections,
    this.videos,
    this.search,
    this.total,
    this.matches,
    this.start,
    this.end,
  });

  factory PurpleContent.fromJson(Map<String, dynamic> json) => PurpleContent(
        description: json["description"] == null
            ? null
            : Description.fromJson(json["description"]),
        urbSubmitters: json["urbSubmitters"] == null
            ? []
            : List<dynamic>.from(json["urbSubmitters"]!.map((x) => x)),
        tags: json["tags"] == null ? null : FluffyTags.fromJson(json["tags"]),
        preparationSteps: json["preparationSteps"] == null
            ? []
            : List<String>.from(json["preparationSteps"]!.map((x) => x)),
        moreContent: json["moreContent"] == null
            ? null
            : MoreContent.fromJson(json["moreContent"]),
        tagsAds:
            json["tagsAds"] == null ? null : TagsAds.fromJson(json["tagsAds"]),
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        relatedContent: json["relatedContent"] == null
            ? null
            : MoreContent.fromJson(json["relatedContent"]),
        ingredientLines: json["ingredientLines"] == null
            ? []
            : List<IngredientLine>.from(json["ingredientLines"]!
                .map((x) => IngredientLine.fromJson(x))),
        unitSystem: unitSystemValues.map[json["unitSystem"]] ?? null,
        reviews:
            json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
        relatedProducts: json["relatedProducts"] == null
            ? null
            : MoreContent.fromJson(json["relatedProducts"]),
        preparationStepCount: json["preparationStepCount"],
        nutrition: json["nutrition"] == null
            ? null
            : Nutrition.fromJson(json["nutrition"]),
        yums: json["yums"] == null ? null : Yums.fromJson(json["yums"]),
        ctaUrl: json["ctaUrl"],
        platformName: json["platformName"],
        collections: json["collections"] == null
            ? []
            : List<dynamic>.from(json["collections"]!.map((x) => x)),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        search: json["search"] == null ? null : Search.fromJson(json["search"]),
        total: json["total"],
        matches:
            json["matches"] == null ? null : Matches.fromJson(json["matches"]),
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "description": description?.toJson(),
        "urbSubmitters": urbSubmitters == null
            ? []
            : List<dynamic>.from(urbSubmitters!.map((x) => x)),
        "tags": tags?.toJson(),
        "preparationSteps": preparationSteps == null
            ? []
            : List<dynamic>.from(preparationSteps!.map((x) => x)),
        "moreContent": moreContent?.toJson(),
        "tagsAds": tagsAds?.toJson(),
        "details": details?.toJson(),
        "relatedContent": relatedContent?.toJson(),
        "ingredientLines": ingredientLines == null
            ? []
            : List<dynamic>.from(ingredientLines!.map((x) => x.toJson())),
        "unitSystem": unitSystemValues.reverse[unitSystem],
        "reviews": reviews?.toJson(),
        "relatedProducts": relatedProducts?.toJson(),
        "preparationStepCount": preparationStepCount,
        "nutrition": nutrition?.toJson(),
        "yums": yums?.toJson(),
        "ctaUrl": ctaUrl,
        "platformName": platformName,
        "collections": collections == null
            ? []
            : List<dynamic>.from(collections!.map((x) => x)),
        "videos": videos?.toJson(),
        "search": search?.toJson(),
        "total": total,
        "matches": matches?.toJson(),
        "start": start,
        "end": end,
      };
}

class Description {
  String mobileSectionName;
  String text;
  dynamic shortText;

  Description({
    required this.mobileSectionName,
    required this.text,
    this.shortText,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        mobileSectionName: json["mobileSectionName"],
        text: json["text"],
        shortText: json["shortText"],
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName": mobileSectionName,
        "text": text,
        "shortText": shortText,
      };
}

class Details {
  String? directionsUrl;
  String? totalTime;
  String? displayName;
  List<Pimage>? images;
  String? name;
  List<String>? keywords;
  dynamic brand;
  String id;
  Attribution? attribution;
  String? recipeId;
  int? numberOfServings;
  String? globalId;
  int? totalTimeInSeconds;
  double? rating;
  String? title;

  Details({
    this.directionsUrl,
    this.totalTime,
    this.displayName,
    this.images,
    this.name,
    this.keywords,
    this.brand,
    required this.id,
    this.attribution,
    this.recipeId,
    this.numberOfServings,
    this.globalId,
    this.totalTimeInSeconds,
    this.rating,
    this.title,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        directionsUrl: json["directionsUrl"],
        totalTime: json["totalTime"],
        displayName: json["displayName"],
        images: json["images"] == null
            ? []
            : List<Pimage>.from(json["images"]!.map((x) => Pimage.fromJson(x))),
        name: json["name"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        brand: json["brand"],
        id: json["id"],
        attribution: json["attribution"] == null
            ? null
            : Attribution.fromJson(json["attribution"]),
        recipeId: json["recipeId"],
        numberOfServings: json["numberOfServings"],
        globalId: json["globalId"],
        totalTimeInSeconds: json["totalTimeInSeconds"],
        rating: json["rating"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "directionsUrl": directionsUrl,
        "totalTime": totalTime,
        "displayName": displayName,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "brand": brand,
        "id": id,
        "attribution": attribution?.toJson(),
        "recipeId": recipeId,
        "numberOfServings": numberOfServings,
        "globalId": globalId,
        "totalTimeInSeconds": totalTimeInSeconds,
        "rating": rating,
        "title": title,
      };
}

class Attribution {
  String html;
  String url;
  String text;
  String logo;

  Attribution({
    required this.html,
    required this.url,
    required this.text,
    required this.logo,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        html: json["html"],
        url: json["url"],
        text: json["text"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "html": html,
        "url": url,
        "text": text,
        "logo": logo,
      };
}

class Pimage {
  String hostedLargeUrl;
  String resizableImageUrl;
  int resizableImageHeight;
  int resizableImageWidth;

  Pimage({
    required this.hostedLargeUrl,
    required this.resizableImageUrl,
    required this.resizableImageHeight,
    required this.resizableImageWidth,
  });

  factory Pimage.fromJson(Map<String, dynamic> json) => Pimage(
        hostedLargeUrl: json["hostedLargeUrl"],
        resizableImageUrl: json["resizableImageUrl"],
        resizableImageHeight: json["resizableImageHeight"],
        resizableImageWidth: json["resizableImageWidth"],
      );

  Map<String, dynamic> toJson() => {
        "hostedLargeUrl": hostedLargeUrl,
        "resizableImageUrl": resizableImageUrl,
        "resizableImageHeight": resizableImageHeight,
        "resizableImageWidth": resizableImageWidth,
      };
}

class IngredientLine {
  String? category;
  Amount amount;
  String unit;
  String ingredientId;
  String? categoryId;
  List<RelatedRecipeSearchTerm> relatedRecipeSearchTerm;
  String ingredient;
  String id;
  String? remainder;
  double? quantity;
  String wholeLine;

  IngredientLine({
    this.category,
    required this.amount,
    required this.unit,
    required this.ingredientId,
    this.categoryId,
    required this.relatedRecipeSearchTerm,
    required this.ingredient,
    required this.id,
    this.remainder,
    this.quantity,
    required this.wholeLine,
  });

  factory IngredientLine.fromJson(Map<String, dynamic> json) => IngredientLine(
        category: json["category"],
        amount: Amount.fromJson(json["amount"]),
        unit: json["unit"],
        ingredientId: json["ingredientId"],
        categoryId: json["categoryId"],
        relatedRecipeSearchTerm: List<RelatedRecipeSearchTerm>.from(
            json["relatedRecipeSearchTerm"]
                .map((x) => RelatedRecipeSearchTerm.fromJson(x))),
        ingredient: json["ingredient"],
        id: json["id"],
        remainder: json["remainder"],
        quantity: json["quantity"]?.toDouble(),
        wholeLine: json["wholeLine"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "amount": amount.toJson(),
        "unit": unit,
        "ingredientId": ingredientId,
        "categoryId": categoryId,
        "relatedRecipeSearchTerm":
            List<dynamic>.from(relatedRecipeSearchTerm.map((x) => x.toJson())),
        "ingredient": ingredient,
        "id": id,
        "remainder": remainder,
        "quantity": quantity,
        "wholeLine": wholeLine,
      };
}

class Amount {
  Imperial metric;
  Imperial imperial;

  Amount({
    required this.metric,
    required this.imperial,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        metric: Imperial.fromJson(json["metric"]),
        imperial: Imperial.fromJson(json["imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "metric": metric.toJson(),
        "imperial": imperial.toJson(),
      };
}

class Imperial {
  ImperialUnit unit;
  double? quantity;

  Imperial({
    required this.unit,
    this.quantity,
  });

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        unit: ImperialUnit.fromJson(json["unit"]),
        quantity: json["quantity"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "unit": unit.toJson(),
        "quantity": quantity,
      };
}

class ImperialUnit {
  String id;
  String name;
  String abbreviation;
  String plural;
  String pluralAbbreviation;
  Kind kind;
  bool decimal;

  ImperialUnit({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.plural,
    required this.pluralAbbreviation,
    required this.kind,
    required this.decimal,
  });

  factory ImperialUnit.fromJson(Map<String, dynamic> json) => ImperialUnit(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
        plural: json["plural"],
        pluralAbbreviation: json["pluralAbbreviation"],
        kind: kindValues.map[json["kind"]]!,
        decimal: json["decimal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abbreviation": abbreviation,
        "plural": plural,
        "pluralAbbreviation": pluralAbbreviation,
        "kind": kindValues.reverse[kind],
        "decimal": decimal,
      };
}

enum Kind { COUNT, VOLUME, LENGTH, MASS }

final kindValues = EnumValues({
  "count": Kind.COUNT,
  "length": Kind.LENGTH,
  "mass": Kind.MASS,
  "volume": Kind.VOLUME
});

class RelatedRecipeSearchTerm {
  String allowedIngredient;

  RelatedRecipeSearchTerm({
    required this.allowedIngredient,
  });

  factory RelatedRecipeSearchTerm.fromJson(Map<String, dynamic> json) =>
      RelatedRecipeSearchTerm(
        allowedIngredient: json["allowedIngredient"],
      );

  Map<String, dynamic> toJson() => {
        "allowedIngredient": allowedIngredient,
      };
}

class Matches {
  MatchesSeo seo;
  List<MatchesFeed> feed;
  List<dynamic> parsedIngredients;
  dynamic indexableMatches;
  Meta meta;
  RelatedPhrases relatedPhrases;
  int adTrackingCampaign;
  Criteria criteria;
  IngredientMatchCount ingredientMatchCount;
  int totalMatchCount;
  bool noindex;
  dynamic adTargetingPhrase;
  List<dynamic> unrelatedSearchResults;
  dynamic relatedSearchResults;

  Matches({
    required this.seo,
    required this.feed,
    required this.parsedIngredients,
    this.indexableMatches,
    required this.meta,
    required this.relatedPhrases,
    required this.adTrackingCampaign,
    required this.criteria,
    required this.ingredientMatchCount,
    required this.totalMatchCount,
    required this.noindex,
    this.adTargetingPhrase,
    required this.unrelatedSearchResults,
    this.relatedSearchResults,
  });

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
        seo: MatchesSeo.fromJson(json["seo"]),
        feed: List<MatchesFeed>.from(
            json["feed"].map((x) => MatchesFeed.fromJson(x))),
        parsedIngredients:
            List<dynamic>.from(json["parsedIngredients"].map((x) => x)),
        indexableMatches: json["indexableMatches"],
        meta: Meta.fromJson(json["meta"]),
        relatedPhrases: RelatedPhrases.fromJson(json["relatedPhrases"]),
        adTrackingCampaign: json["adTrackingCampaign"],
        criteria: Criteria.fromJson(json["criteria"]),
        ingredientMatchCount:
            IngredientMatchCount.fromJson(json["ingredientMatchCount"]),
        totalMatchCount: json["totalMatchCount"],
        noindex: json["noindex"],
        adTargetingPhrase: json["adTargetingPhrase"],
        unrelatedSearchResults:
            List<dynamic>.from(json["unrelatedSearchResults"].map((x) => x)),
        relatedSearchResults: json["relatedSearchResults"],
      );

  Map<String, dynamic> toJson() => {
        "seo": seo.toJson(),
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
        "parsedIngredients":
            List<dynamic>.from(parsedIngredients.map((x) => x)),
        "indexableMatches": indexableMatches,
        "meta": meta.toJson(),
        "relatedPhrases": relatedPhrases.toJson(),
        "adTrackingCampaign": adTrackingCampaign,
        "criteria": criteria.toJson(),
        "ingredientMatchCount": ingredientMatchCount.toJson(),
        "totalMatchCount": totalMatchCount,
        "noindex": noindex,
        "adTargetingPhrase": adTargetingPhrase,
        "unrelatedSearchResults":
            List<dynamic>.from(unrelatedSearchResults.map((x) => x)),
        "relatedSearchResults": relatedSearchResults,
      };
}

class Criteria {
  String q;
  List<Locale> boostLocales;
  IngredientMatchCount flavor;
  bool fullReviews;
  Locale locale;
  dynamic time;
  bool connected;
  bool fetchRecipes;
  bool ignoreTastePref;
  bool myyums;
  bool expandRelatedSearches;
  int timeoutMillis;
  dynamic facetFields;
  bool requirePictures;
  IngredientMatchCount passthrough;
  int reviewsPerRecipe;
  IngredientMatchCount ingredients;
  int max;
  dynamic ingredientCount;
  dynamic imageSize;
  bool recipeUnsearchable;
  bool guided;
  bool autocomplete;
  int timeout;
  IngredientMatchCount nutrition;
  bool recognitionEnabled;
  dynamic skip;
  dynamic reviewImagesPerRecipe;

  Criteria({
    required this.q,
    required this.boostLocales,
    required this.flavor,
    required this.fullReviews,
    required this.locale,
    this.time,
    required this.connected,
    required this.fetchRecipes,
    required this.ignoreTastePref,
    required this.myyums,
    required this.expandRelatedSearches,
    required this.timeoutMillis,
    this.facetFields,
    required this.requirePictures,
    required this.passthrough,
    required this.reviewsPerRecipe,
    required this.ingredients,
    required this.max,
    this.ingredientCount,
    this.imageSize,
    required this.recipeUnsearchable,
    required this.guided,
    required this.autocomplete,
    required this.timeout,
    required this.nutrition,
    required this.recognitionEnabled,
    this.skip,
    this.reviewImagesPerRecipe,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) => Criteria(
        q: json["q"],
        boostLocales: List<Locale>.from(
            json["boost-locales"].map((x) => localeValues.map[x]!)),
        flavor: IngredientMatchCount.fromJson(json["flavor"]),
        fullReviews: json["full-reviews?"],
        locale: localeValues.map[json["locale"]]!,
        time: json["time"],
        connected: json["connected"],
        fetchRecipes: json["fetch-recipes?"],
        ignoreTastePref: json["ignore-taste-pref?"],
        myyums: json["myyums"],
        expandRelatedSearches: json["expand-related-searches?"],
        timeoutMillis: json["timeout-millis"],
        facetFields: json["facet-fields"],
        requirePictures: json["require-pictures?"],
        passthrough: IngredientMatchCount.fromJson(json["passthrough"]),
        reviewsPerRecipe: json["reviews-per-recipe"],
        ingredients: IngredientMatchCount.fromJson(json["ingredients"]),
        max: json["max"],
        ingredientCount: json["ingredient-count"],
        imageSize: json["image-size"],
        recipeUnsearchable: json["recipe_unsearchable"],
        guided: json["guided"],
        autocomplete: json["autocomplete"],
        timeout: json["timeout"],
        nutrition: IngredientMatchCount.fromJson(json["nutrition"]),
        recognitionEnabled: json["recognition-enabled"],
        skip: json["skip"],
        reviewImagesPerRecipe: json["review-images-per-recipe"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "boost-locales": List<dynamic>.from(
            boostLocales.map((x) => localeValues.reverse[x])),
        "flavor": flavor.toJson(),
        "full-reviews?": fullReviews,
        "locale": localeValues.reverse[locale],
        "time": time,
        "connected": connected,
        "fetch-recipes?": fetchRecipes,
        "ignore-taste-pref?": ignoreTastePref,
        "myyums": myyums,
        "expand-related-searches?": expandRelatedSearches,
        "timeout-millis": timeoutMillis,
        "facet-fields": facetFields,
        "require-pictures?": requirePictures,
        "passthrough": passthrough.toJson(),
        "reviews-per-recipe": reviewsPerRecipe,
        "ingredients": ingredients.toJson(),
        "max": max,
        "ingredient-count": ingredientCount,
        "image-size": imageSize,
        "recipe_unsearchable": recipeUnsearchable,
        "guided": guided,
        "autocomplete": autocomplete,
        "timeout": timeout,
        "nutrition": nutrition.toJson(),
        "recognition-enabled": recognitionEnabled,
        "skip": skip,
        "review-images-per-recipe": reviewImagesPerRecipe,
      };
}

enum Locale { EN_US }

final localeValues = EnumValues({"en-US": Locale.EN_US});

class IngredientMatchCount {
  IngredientMatchCount();

  factory IngredientMatchCount.fromJson(Map<String, dynamic> json) =>
      IngredientMatchCount();

  Map<String, dynamic> toJson() => {};
}

class MatchesFeed {
  PurpleSeo seo;
  String trackingId;
  Locale locale;
  FluffyContent content;
  FeedType type;
  List<RecipeType> recipeType;
  bool proRecipe;
  PurpleDisplay display;
  bool promoted;
  SearchResult searchResult;

  MatchesFeed({
    required this.seo,
    required this.trackingId,
    required this.locale,
    required this.content,
    required this.type,
    required this.recipeType,
    required this.proRecipe,
    required this.display,
    required this.promoted,
    required this.searchResult,
  });

  factory MatchesFeed.fromJson(Map<String, dynamic> json) => MatchesFeed(
        seo: PurpleSeo.fromJson(json["seo"]),
        trackingId: json["tracking-id"],
        locale: localeValues.map[json["locale"]]!,
        content: FluffyContent.fromJson(json["content"]),
        type: feedTypeValues.map[json["type"]]!,
        recipeType: List<RecipeType>.from(
            json["recipeType"].map((x) => recipeTypeValues.map[x]!)),
        proRecipe: json["proRecipe"],
        display: PurpleDisplay.fromJson(json["display"]),
        promoted: json["promoted"],
        searchResult: SearchResult.fromJson(json["searchResult"]),
      );

  Map<String, dynamic> toJson() => {
        "seo": seo.toJson(),
        "tracking-id": trackingId,
        "locale": localeValues.reverse[locale],
        "content": content.toJson(),
        "type": feedTypeValues.reverse[type],
        "recipeType": List<dynamic>.from(
            recipeType.map((x) => recipeTypeValues.reverse[x])),
        "proRecipe": proRecipe,
        "display": display.toJson(),
        "promoted": promoted,
        "searchResult": searchResult.toJson(),
      };
}

class FluffyContent {
  dynamic description;
  List<dynamic> urbSubmitters;
  PurpleTags tags;
  dynamic preparationSteps;
  MoreContent moreContent;
  TagsAds tagsAds;
  Details details;
  MoreContent relatedContent;
  List<IngredientLine> ingredientLines;
  UnitSystem unitSystem;
  Reviews reviews;
  MoreContent relatedProducts;
  int preparationStepCount;
  Nutrition nutrition;
  Yums yums;

  FluffyContent({
    this.description,
    required this.urbSubmitters,
    required this.tags,
    this.preparationSteps,
    required this.moreContent,
    required this.tagsAds,
    required this.details,
    required this.relatedContent,
    required this.ingredientLines,
    required this.unitSystem,
    required this.reviews,
    required this.relatedProducts,
    required this.preparationStepCount,
    required this.nutrition,
    required this.yums,
  });

  factory FluffyContent.fromJson(Map<String, dynamic> json) => FluffyContent(
        description: json["description"],
        urbSubmitters: List<dynamic>.from(json["urbSubmitters"].map((x) => x)),
        tags: PurpleTags.fromJson(json["tags"]),
        preparationSteps: json["preparationSteps"],
        moreContent: MoreContent.fromJson(json["moreContent"]),
        tagsAds: TagsAds.fromJson(json["tagsAds"]),
        details: Details.fromJson(json["details"]),
        relatedContent: MoreContent.fromJson(json["relatedContent"]),
        ingredientLines: List<IngredientLine>.from(
            json["ingredientLines"].map((x) => IngredientLine.fromJson(x))),
        unitSystem: unitSystemValues.map[json["unitSystem"]]!,
        reviews: Reviews.fromJson(json["reviews"]),
        relatedProducts: MoreContent.fromJson(json["relatedProducts"]),
        preparationStepCount: json["preparationStepCount"],
        nutrition: Nutrition.fromJson(json["nutrition"]),
        yums: Yums.fromJson(json["yums"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "urbSubmitters": List<dynamic>.from(urbSubmitters.map((x) => x)),
        "tags": tags.toJson(),
        "preparationSteps": preparationSteps,
        "moreContent": moreContent.toJson(),
        "tagsAds": tagsAds.toJson(),
        "details": details.toJson(),
        "relatedContent": relatedContent.toJson(),
        "ingredientLines":
            List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
        "unitSystem": unitSystemValues.reverse[unitSystem],
        "reviews": reviews.toJson(),
        "relatedProducts": relatedProducts.toJson(),
        "preparationStepCount": preparationStepCount,
        "nutrition": nutrition.toJson(),
        "yums": yums.toJson(),
      };
}

class MoreContent {
  String mobileSectionName;
  QueryParams queryParams;
  List<dynamic> feed;

  MoreContent({
    required this.mobileSectionName,
    required this.queryParams,
    required this.feed,
  });

  factory MoreContent.fromJson(Map<String, dynamic> json) => MoreContent(
        mobileSectionName: json["mobileSectionName"],
        queryParams: QueryParams.fromJson(json["queryParams"]),
        feed: List<dynamic>.from(json["feed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName": mobileSectionName,
        "queryParams": queryParams.toJson(),
        "feed": List<dynamic>.from(feed.map((x) => x)),
      };
}

class QueryParams {
  int start;
  String? authorId;
  String id;
  ApiFeedType? apiFeedType;
  RelatedContentType? relatedContentType;

  QueryParams({
    required this.start,
    this.authorId,
    required this.id,
    required this.apiFeedType,
    this.relatedContentType,
  });

  factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
        start: json["start"],
        authorId: json["authorId"],
        id: json["id"],
        apiFeedType: apiFeedTypeValues.map[json["apiFeedType"]] ?? null,
        relatedContentType:
            relatedContentTypeValues.map[json["relatedContentType"]] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "authorId": authorId,
        "id": id,
        "apiFeedType": apiFeedTypeValues.reverse[apiFeedType],
        "relatedContentType":
            relatedContentTypeValues.reverse[relatedContentType],
      };
}

enum ApiFeedType { MORE_FROM, RELATED }

final apiFeedTypeValues = EnumValues(
    {"moreFrom": ApiFeedType.MORE_FROM, "related": ApiFeedType.RELATED});

enum RelatedContentType { PRODUCT }

final relatedContentTypeValues =
    EnumValues({"product": RelatedContentType.PRODUCT});

class Nutrition {
  NutritionMobileSectionName mobileSectionName;
  List<NutritionEstimate> nutritionEstimates;

  Nutrition({
    required this.mobileSectionName,
    required this.nutritionEstimates,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        mobileSectionName:
            nutritionMobileSectionNameValues.map[json["mobileSectionName"]]!,
        nutritionEstimates: List<NutritionEstimate>.from(
            json["nutritionEstimates"]
                .map((x) => NutritionEstimate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName":
            nutritionMobileSectionNameValues.reverse[mobileSectionName],
        "nutritionEstimates":
            List<dynamic>.from(nutritionEstimates.map((x) => x.toJson())),
      };
}

enum NutritionMobileSectionName { NUTRITION }

final nutritionMobileSectionNameValues =
    EnumValues({"Nutrition": NutritionMobileSectionName.NUTRITION});

class NutritionEstimate {
  Attribute attribute;
  double value;
  NutritionEstimateUnit unit;
  NutritionEstimateDisplay display;

  NutritionEstimate({
    required this.attribute,
    required this.value,
    required this.unit,
    required this.display,
  });

  factory NutritionEstimate.fromJson(Map<String, dynamic> json) =>
      NutritionEstimate(
        attribute: attributeValues.map[json["attribute"]]!,
        value: json["value"]?.toDouble(),
        unit: NutritionEstimateUnit.fromJson(json["unit"]),
        display: NutritionEstimateDisplay.fromJson(json["display"]),
      );

  Map<String, dynamic> toJson() => {
        "attribute": attributeValues.reverse[attribute],
        "value": value,
        "unit": unit.toJson(),
        "display": display.toJson(),
      };
}

enum Attribute {
  FAT_KCAL,
  NA,
  FAT,
  VITC,
  ENERC_KCAL,
  FATRN,
  VITA_IU,
  FASAT,
  K,
  CA,
  CHOLE,
  CHOCDF,
  PROCNT,
  FIBTG,
  SUGAR,
  FE
}

final attributeValues = EnumValues({
  "CA": Attribute.CA,
  "CHOCDF": Attribute.CHOCDF,
  "CHOLE": Attribute.CHOLE,
  "ENERC_KCAL": Attribute.ENERC_KCAL,
  "FASAT": Attribute.FASAT,
  "FAT": Attribute.FAT,
  "FATRN": Attribute.FATRN,
  "FAT_KCAL": Attribute.FAT_KCAL,
  "FE": Attribute.FE,
  "FIBTG": Attribute.FIBTG,
  "K": Attribute.K,
  "NA": Attribute.NA,
  "PROCNT": Attribute.PROCNT,
  "SUGAR": Attribute.SUGAR,
  "VITA_IU": Attribute.VITA_IU,
  "VITC": Attribute.VITC
});

class NutritionEstimateDisplay {
  dynamic value;
  UnitEnum? unit;
  dynamic percentDailyValue;

  NutritionEstimateDisplay({
    this.value,
    this.unit,
    this.percentDailyValue,
  });

  factory NutritionEstimateDisplay.fromJson(Map<String, dynamic> json) =>
      NutritionEstimateDisplay(
        value: json["value"],
        unit: unitEnumValues.map[json["unit"]] ?? null,
        percentDailyValue: json["percentDailyValue"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitEnumValues.reverse[unit],
        "percentDailyValue": percentDailyValue,
      };
}

enum UnitEnum { MG, G }

final unitEnumValues = EnumValues({"g": UnitEnum.G, "mg": UnitEnum.MG});

class NutritionEstimateUnit {
  Name name;
  Abbreviation abbreviation;
  Plural plural;
  bool decimal;

  NutritionEstimateUnit({
    required this.name,
    required this.abbreviation,
    required this.plural,
    required this.decimal,
  });

  factory NutritionEstimateUnit.fromJson(Map<String, dynamic> json) =>
      NutritionEstimateUnit(
        name: nameValues.map[json["name"]]!,
        abbreviation: abbreviationValues.map[json["abbreviation"]]!,
        plural: pluralValues.map[json["plural"]]!,
        decimal: json["decimal"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "abbreviation": abbreviationValues.reverse[abbreviation],
        "plural": pluralValues.reverse[plural],
        "decimal": decimal,
      };
}

enum Abbreviation { KCAL, G, IU }

final abbreviationValues = EnumValues(
    {"g": Abbreviation.G, "IU": Abbreviation.IU, "kcal": Abbreviation.KCAL});

enum Name { CALORIE, GRAM, IU }

final nameValues =
    EnumValues({"calorie": Name.CALORIE, "gram": Name.GRAM, "IU": Name.IU});

enum Plural { CALORIES, GRAMS, IU }

final pluralValues = EnumValues(
    {"calories": Plural.CALORIES, "grams": Plural.GRAMS, "IU": Plural.IU});

class Reviews {
  ReviewsMobileSectionName mobileSectionName;
  int totalReviewCount;
  double? averageRating;
  List<dynamic> reviews;
  dynamic thisUserReview;
  SortBy sortBy;

  Reviews({
    required this.mobileSectionName,
    required this.totalReviewCount,
    this.averageRating,
    required this.reviews,
    this.thisUserReview,
    required this.sortBy,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        mobileSectionName:
            reviewsMobileSectionNameValues.map[json["mobileSectionName"]]!,
        totalReviewCount: json["totalReviewCount"],
        averageRating: json["averageRating"]?.toDouble(),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        thisUserReview: json["thisUserReview"],
        sortBy: sortByValues.map[json["sortBy"]]!,
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName":
            reviewsMobileSectionNameValues.reverse[mobileSectionName],
        "totalReviewCount": totalReviewCount,
        "averageRating": averageRating,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "thisUserReview": thisUserReview,
        "sortBy": sortByValues.reverse[sortBy],
      };
}

enum ReviewsMobileSectionName { REVIEWS }

final reviewsMobileSectionNameValues =
    EnumValues({"Reviews": ReviewsMobileSectionName.REVIEWS});

enum SortBy { CREATE_TIME }

final sortByValues = EnumValues({"create-time": SortBy.CREATE_TIME});

class PurpleTags {
  List<AllergyPreference> course;
  List<AllergyPreference>? nutrition;
  List<AllergyPreference>? technique;
  List<AllergyPreference>? difficulty;
  List<AllergyPreference>? dish;

  PurpleTags({
    required this.course,
    this.nutrition,
    this.technique,
    this.difficulty,
    this.dish,
  });

  factory PurpleTags.fromJson(Map<String, dynamic> json) => PurpleTags(
        course: List<AllergyPreference>.from(
            json["course"].map((x) => AllergyPreference.fromJson(x))),
        nutrition: json["nutrition"] == null
            ? []
            : List<AllergyPreference>.from(
                json["nutrition"]!.map((x) => AllergyPreference.fromJson(x))),
        technique: json["technique"] == null
            ? []
            : List<AllergyPreference>.from(
                json["technique"]!.map((x) => AllergyPreference.fromJson(x))),
        difficulty: json["difficulty"] == null
            ? []
            : List<AllergyPreference>.from(
                json["difficulty"]!.map((x) => AllergyPreference.fromJson(x))),
        dish: json["dish"] == null
            ? []
            : List<AllergyPreference>.from(
                json["dish"]!.map((x) => AllergyPreference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course": List<dynamic>.from(course.map((x) => x.toJson())),
        "nutrition": nutrition == null
            ? []
            : List<dynamic>.from(nutrition!.map((x) => x.toJson())),
        "technique": technique == null
            ? []
            : List<dynamic>.from(technique!.map((x) => x.toJson())),
        "difficulty": difficulty == null
            ? []
            : List<dynamic>.from(difficulty!.map((x) => x.toJson())),
        "dish": dish == null
            ? []
            : List<dynamic>.from(dish!.map((x) => x.toJson())),
      };
}

class AllergyPreference {
  String displayName;
  String tagUrl;

  AllergyPreference({
    required this.displayName,
    required this.tagUrl,
  });

  factory AllergyPreference.fromJson(Map<String, dynamic> json) =>
      AllergyPreference(
        displayName: json["display-name"],
        tagUrl: json["tag-url"],
      );

  Map<String, dynamic> toJson() => {
        "display-name": displayName,
        "tag-url": tagUrl,
      };
}

class TagsAds {
  List<AllergyPreference>? adtag;

  TagsAds({
    this.adtag,
  });

  factory TagsAds.fromJson(Map<String, dynamic> json) => TagsAds(
        adtag: json["adtag"] == null
            ? []
            : List<AllergyPreference>.from(
                json["adtag"]!.map((x) => AllergyPreference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "adtag": adtag == null
            ? []
            : List<dynamic>.from(adtag!.map((x) => x.toJson())),
      };
}

enum UnitSystem { IMPERIAL, METRIC }

final unitSystemValues =
    EnumValues({"imperial": UnitSystem.IMPERIAL, "metric": UnitSystem.METRIC});

class Yums {
  int count;
  ThisUser thisUser;

  Yums({
    required this.count,
    required this.thisUser,
  });

  factory Yums.fromJson(Map<String, dynamic> json) => Yums(
        count: json["count"],
        thisUser: thisUserValues.map[json["this-user"]]!,
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "this-user": thisUserValues.reverse[thisUser],
      };
}

enum ThisUser { NONE }

final thisUserValues = EnumValues({"none": ThisUser.NONE});

class PurpleDisplay {
  String displayName;
  List<String> images;
  dynamic flag;
  PurpleSource source;
  List<Profile> profiles;
  dynamic displayPrepStepsInline;
  List<dynamic> collections;

  PurpleDisplay({
    required this.displayName,
    required this.images,
    this.flag,
    required this.source,
    required this.profiles,
    this.displayPrepStepsInline,
    required this.collections,
  });

  factory PurpleDisplay.fromJson(Map<String, dynamic> json) => PurpleDisplay(
        displayName: json["displayName"],
        images: List<String>.from(json["images"].map((x) => x)),
        flag: json["flag"],
        source: PurpleSource.fromJson(json["source"]),
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
        displayPrepStepsInline: json["displayPrepStepsInline"],
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "images": List<dynamic>.from(images.map((x) => x)),
        "flag": flag,
        "source": source.toJson(),
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
        "displayPrepStepsInline": displayPrepStepsInline,
        "collections": List<dynamic>.from(collections.map((x) => x)),
      };
}

class Profile {
  String? profileName;
  String? displayName;
  String? siteUrl;
  String? pictureUrl;
  String? pageUrl;
  String? description;
  ProfileType? type;
  String? profileUrl;

  Profile({
    this.profileName,
    this.displayName,
    this.siteUrl,
    this.pictureUrl,
    this.pageUrl,
    this.description,
    this.type,
    this.profileUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        profileName: json["profileName"],
        displayName: json["displayName"],
        siteUrl: json["siteUrl"],
        pictureUrl: json["pictureUrl"],
        pageUrl: json["pageUrl"],
        description: json["description"],
        type: profileTypeValues.map[json["type"]] ?? null,
        profileUrl: json["profileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "profileName": profileName,
        "displayName": displayName,
        "siteUrl": siteUrl,
        "pictureUrl": pictureUrl,
        "pageUrl": pageUrl,
        "description": description,
        "type": profileTypeValues.reverse[type],
        "profileUrl": profileUrl,
      };
}

enum ProfileType { CONTENT_OWNER }

final profileTypeValues =
    EnumValues({"content-owner": ProfileType.CONTENT_OWNER});

class PurpleSource {
  String sourceRecipeUrl;
  dynamic sourceFaviconUrl;
  bool sourceHttpsOk;
  bool sourceInFrame;
  String sourceDisplayName;
  bool? proSource;
  String sourceSiteUrl;
  IntroVideo introVideo;
  dynamic eyebrowText;
  String sourcePageUrl;
  dynamic marketingCopy;
  bool sourceHttpOk;
  dynamic marketingImage;

  PurpleSource({
    required this.sourceRecipeUrl,
    this.sourceFaviconUrl,
    required this.sourceHttpsOk,
    required this.sourceInFrame,
    required this.sourceDisplayName,
    this.proSource,
    required this.sourceSiteUrl,
    required this.introVideo,
    this.eyebrowText,
    required this.sourcePageUrl,
    this.marketingCopy,
    required this.sourceHttpOk,
    this.marketingImage,
  });

  factory PurpleSource.fromJson(Map<String, dynamic> json) => PurpleSource(
        sourceRecipeUrl: json["sourceRecipeUrl"],
        sourceFaviconUrl: json["sourceFaviconUrl"],
        sourceHttpsOk: json["sourceHttpsOk"],
        sourceInFrame: json["sourceInFrame"],
        sourceDisplayName: json["sourceDisplayName"],
        proSource: json["proSource"],
        sourceSiteUrl: json["sourceSiteUrl"],
        introVideo: IntroVideo.fromJson(json["introVideo"]),
        eyebrowText: json["eyebrowText"],
        sourcePageUrl: json["sourcePageUrl"],
        marketingCopy: json["marketingCopy"],
        sourceHttpOk: json["sourceHttpOk"],
        marketingImage: json["marketingImage"],
      );

  Map<String, dynamic> toJson() => {
        "sourceRecipeUrl": sourceRecipeUrl,
        "sourceFaviconUrl": sourceFaviconUrl,
        "sourceHttpsOk": sourceHttpsOk,
        "sourceInFrame": sourceInFrame,
        "sourceDisplayName": sourceDisplayName,
        "proSource": proSource,
        "sourceSiteUrl": sourceSiteUrl,
        "introVideo": introVideo.toJson(),
        "eyebrowText": eyebrowText,
        "sourcePageUrl": sourcePageUrl,
        "marketingCopy": marketingCopy,
        "sourceHttpOk": sourceHttpOk,
        "marketingImage": marketingImage,
      };
}

class IntroVideo {
  String? id;
  String? originalUrl;
  String? hlsUrl;
  String? dashUrl;
  bool? hasAudio;
  Snapshot snapshot;

  IntroVideo({
    this.id,
    this.originalUrl,
    this.hlsUrl,
    this.dashUrl,
    this.hasAudio,
    required this.snapshot,
  });

  factory IntroVideo.fromJson(Map<String, dynamic> json) => IntroVideo(
        id: json["id"],
        originalUrl: json["originalUrl"],
        hlsUrl: json["hlsUrl"],
        dashUrl: json["dashUrl"],
        hasAudio: json["hasAudio"],
        snapshot: Snapshot.fromJson(json["snapshot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "originalUrl": originalUrl,
        "hlsUrl": hlsUrl,
        "dashUrl": dashUrl,
        "hasAudio": hasAudio,
        "snapshot": snapshot.toJson(),
      };
}

class Snapshot {
  String? original;
  String? resizable;

  Snapshot({
    this.original,
    this.resizable,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) => Snapshot(
        original: json["original"],
        resizable: json["resizable"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "resizable": resizable,
      };
}

enum RecipeType { BASIC_RECIPE, YUMMLY_ORIGINAL, PRO_RECIPE, GUIDED_RECIPE }

final recipeTypeValues = EnumValues({
  "BasicRecipe": RecipeType.BASIC_RECIPE,
  "GuidedRecipe": RecipeType.GUIDED_RECIPE,
  "ProRecipe": RecipeType.PRO_RECIPE,
  "YummlyOriginal": RecipeType.YUMMLY_ORIGINAL
});

class SearchResult {
  double score;

  SearchResult({
    required this.score,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        score: json["score"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
      };
}

class PurpleSeo {
  PurpleWeb web;
  SpotlightSearch spotlightSearch;
  SpotlightSearchClass firebase;

  PurpleSeo({
    required this.web,
    required this.spotlightSearch,
    required this.firebase,
  });

  factory PurpleSeo.fromJson(Map<String, dynamic> json) => PurpleSeo(
        web: PurpleWeb.fromJson(json["web"]),
        spotlightSearch: SpotlightSearch.fromJson(json["spotlightSearch"]),
        firebase: SpotlightSearchClass.fromJson(json["firebase"]),
      );

  Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
      };
}

class SpotlightSearchClass {
  bool noindex;

  SpotlightSearchClass({
    required this.noindex,
  });

  factory SpotlightSearchClass.fromJson(Map<String, dynamic> json) =>
      SpotlightSearchClass(
        noindex: json["noindex"],
      );

  Map<String, dynamic> toJson() => {
        "noindex": noindex,
      };
}

class SpotlightSearch {
  List<String> keywords;
  bool noindex;

  SpotlightSearch({
    required this.keywords,
    required this.noindex,
  });

  factory SpotlightSearch.fromJson(Map<String, dynamic> json) =>
      SpotlightSearch(
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        noindex: json["noindex"],
      );

  Map<String, dynamic> toJson() => {
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "noindex": noindex,
      };
}

class PurpleWeb {
  bool noindex;
  String canonicalTerm;
  MetaTags metaTags;
  List<LinkTag> linkTags;
  String? imageUrl;

  PurpleWeb({
    required this.noindex,
    required this.canonicalTerm,
    required this.metaTags,
    required this.linkTags,
    this.imageUrl,
  });

  factory PurpleWeb.fromJson(Map<String, dynamic> json) => PurpleWeb(
        noindex: json["noindex"],
        canonicalTerm: json["canonical-term"],
        metaTags: MetaTags.fromJson(json["meta-tags"]),
        linkTags: List<LinkTag>.from(
            json["link-tags"].map((x) => LinkTag.fromJson(x))),
        imageUrl: json["image-url"],
      );

  Map<String, dynamic> toJson() => {
        "noindex": noindex,
        "canonical-term": canonicalTerm,
        "meta-tags": metaTags.toJson(),
        "link-tags": List<dynamic>.from(linkTags.map((x) => x.toJson())),
        "image-url": imageUrl,
      };
}

class LinkTag {
  Rel? rel;
  String href;
  Hreflang? hreflang;

  LinkTag({
    this.rel,
    required this.href,
    this.hreflang,
  });

  factory LinkTag.fromJson(Map<String, dynamic> json) => LinkTag(
        rel: relValues.map[json["rel"]] ?? null,
        href: json["href"],
        hreflang: hreflangValues.map[json["hreflang"]] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "rel": relValues.reverse[rel],
        "href": href,
        "hreflang": hreflangValues.reverse[hreflang],
      };
}

enum Hreflang { EN, EN_GB }

final hreflangValues = EnumValues({"en": Hreflang.EN, "en-GB": Hreflang.EN_GB});

enum Rel { CANONICAL, ALTERNATE }

final relValues =
    EnumValues({"alternate": Rel.ALTERNATE, "canonical": Rel.CANONICAL});

class MetaTags {
  String title;
  String description;

  MetaTags({
    required this.title,
    required this.description,
  });

  factory MetaTags.fromJson(Map<String, dynamic> json) => MetaTags(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

enum FeedType { SINGLE_RECIPE, GENERIC_CTA, ARTICLE, SUGGESTED_SEARCH }

final feedTypeValues = EnumValues({
  "article": FeedType.ARTICLE,
  "generic_cta": FeedType.GENERIC_CTA,
  "single recipe": FeedType.SINGLE_RECIPE,
  "suggested_search": FeedType.SUGGESTED_SEARCH
});

class Meta {
  List<String> parsedIngredients;

  Meta({
    required this.parsedIngredients,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        parsedIngredients:
            List<String>.from(json["parsed_ingredients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "parsed_ingredients":
            List<dynamic>.from(parsedIngredients.map((x) => x)),
      };
}

class RelatedPhrases {
  List<String> relatedPhrases;
  List<String> unrelatedPhrases;
  List<String> keywords;
  List<String> recipes;
  String phrase;

  RelatedPhrases({
    required this.relatedPhrases,
    required this.unrelatedPhrases,
    required this.keywords,
    required this.recipes,
    required this.phrase,
  });

  factory RelatedPhrases.fromJson(Map<String, dynamic> json) => RelatedPhrases(
        relatedPhrases: List<String>.from(json["relatedPhrases"].map((x) => x)),
        unrelatedPhrases:
            List<String>.from(json["unrelatedPhrases"].map((x) => x)),
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        recipes: List<String>.from(json["recipes"].map((x) => x)),
        phrase: json["phrase"],
      );

  Map<String, dynamic> toJson() => {
        "relatedPhrases": List<dynamic>.from(relatedPhrases.map((x) => x)),
        "unrelatedPhrases": List<dynamic>.from(unrelatedPhrases.map((x) => x)),
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "recipes": List<dynamic>.from(recipes.map((x) => x)),
        "phrase": phrase,
      };
}

class MatchesSeo {
  FluffyWeb web;
  SpotlightSearchClass firebase;

  MatchesSeo({
    required this.web,
    required this.firebase,
  });

  factory MatchesSeo.fromJson(Map<String, dynamic> json) => MatchesSeo(
        web: FluffyWeb.fromJson(json["web"]),
        firebase: SpotlightSearchClass.fromJson(json["firebase"]),
      );

  Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "firebase": firebase.toJson(),
      };
}

class FluffyWeb {
  bool noindex;
  String displayTitle;
  String canonicalTerm;
  MetaTags metaTags;
  List<LinkTag> linkTags;
  String imageUrl;

  FluffyWeb({
    required this.noindex,
    required this.displayTitle,
    required this.canonicalTerm,
    required this.metaTags,
    required this.linkTags,
    required this.imageUrl,
  });

  factory FluffyWeb.fromJson(Map<String, dynamic> json) => FluffyWeb(
        noindex: json["noindex"],
        displayTitle: json["display-title"],
        canonicalTerm: json["canonical-term"],
        metaTags: MetaTags.fromJson(json["meta-tags"]),
        linkTags: List<LinkTag>.from(
            json["link-tags"].map((x) => LinkTag.fromJson(x))),
        imageUrl: json["image-url"],
      );

  Map<String, dynamic> toJson() => {
        "noindex": noindex,
        "display-title": displayTitle,
        "canonical-term": canonicalTerm,
        "meta-tags": metaTags.toJson(),
        "link-tags": List<dynamic>.from(linkTags.map((x) => x.toJson())),
        "image-url": imageUrl,
      };
}

class Search {
  String q;

  Search({
    required this.q,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        q: json["q"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
      };
}

class FluffyTags {
  List<AllergyPreference>? course;
  List<AllergyPreference>? difficulty;
  List<AllergyPreference>? dish;
  List<AllergyPreference>? nutrition;
  List<AllergyPreference>? technique;
  List<AllergyPreference>? dietPreference;
  List<AllergyPreference>? allergyPreference;
  List<AllergyPreference>? holiday;
  List<AllergyPreference>? cuisine;
  List<AllergyPreference>? pro;

  FluffyTags({
    this.course,
    this.difficulty,
    this.dish,
    this.nutrition,
    this.technique,
    this.dietPreference,
    this.allergyPreference,
    this.holiday,
    this.cuisine,
    this.pro,
  });

  factory FluffyTags.fromJson(Map<String, dynamic> json) => FluffyTags(
        course: json["course"] == null
            ? []
            : List<AllergyPreference>.from(
                json["course"]!.map((x) => AllergyPreference.fromJson(x))),
        difficulty: json["difficulty"] == null
            ? []
            : List<AllergyPreference>.from(
                json["difficulty"]!.map((x) => AllergyPreference.fromJson(x))),
        dish: json["dish"] == null
            ? []
            : List<AllergyPreference>.from(
                json["dish"]!.map((x) => AllergyPreference.fromJson(x))),
        nutrition: json["nutrition"] == null
            ? []
            : List<AllergyPreference>.from(
                json["nutrition"]!.map((x) => AllergyPreference.fromJson(x))),
        technique: json["technique"] == null
            ? []
            : List<AllergyPreference>.from(
                json["technique"]!.map((x) => AllergyPreference.fromJson(x))),
        dietPreference: json["diet-preference"] == null
            ? []
            : List<AllergyPreference>.from(json["diet-preference"]!
                .map((x) => AllergyPreference.fromJson(x))),
        allergyPreference: json["allergy-preference"] == null
            ? []
            : List<AllergyPreference>.from(json["allergy-preference"]!
                .map((x) => AllergyPreference.fromJson(x))),
        holiday: json["holiday"] == null
            ? []
            : List<AllergyPreference>.from(
                json["holiday"]!.map((x) => AllergyPreference.fromJson(x))),
        cuisine: json["cuisine"] == null
            ? []
            : List<AllergyPreference>.from(
                json["cuisine"]!.map((x) => AllergyPreference.fromJson(x))),
        pro: json["pro"] == null
            ? []
            : List<AllergyPreference>.from(
                json["pro"]!.map((x) => AllergyPreference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course": course == null
            ? []
            : List<dynamic>.from(course!.map((x) => x.toJson())),
        "difficulty": difficulty == null
            ? []
            : List<dynamic>.from(difficulty!.map((x) => x.toJson())),
        "dish": dish == null
            ? []
            : List<dynamic>.from(dish!.map((x) => x.toJson())),
        "nutrition": nutrition == null
            ? []
            : List<dynamic>.from(nutrition!.map((x) => x.toJson())),
        "technique": technique == null
            ? []
            : List<dynamic>.from(technique!.map((x) => x.toJson())),
        "diet-preference": dietPreference == null
            ? []
            : List<dynamic>.from(dietPreference!.map((x) => x.toJson())),
        "allergy-preference": allergyPreference == null
            ? []
            : List<dynamic>.from(allergyPreference!.map((x) => x.toJson())),
        "holiday": holiday == null
            ? []
            : List<dynamic>.from(holiday!.map((x) => x.toJson())),
        "cuisine": cuisine == null
            ? []
            : List<dynamic>.from(cuisine!.map((x) => x.toJson())),
        "pro":
            pro == null ? [] : List<dynamic>.from(pro!.map((x) => x.toJson())),
      };
}

class Videos {
  String snapshotUrl;
  IngredientMatchCount videoUrls;
  VideoDetails videoDetails;
  String originalVideoUrl;
  DateTime createTime;

  Videos({
    required this.snapshotUrl,
    required this.videoUrls,
    required this.videoDetails,
    required this.originalVideoUrl,
    required this.createTime,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        snapshotUrl: json["snapshotUrl"],
        videoUrls: IngredientMatchCount.fromJson(json["videoUrls"]),
        videoDetails: VideoDetails.fromJson(json["videoDetails"]),
        originalVideoUrl: json["originalVideoUrl"],
        createTime: DateTime.parse(json["createTime"]),
      );

  Map<String, dynamic> toJson() => {
        "snapshotUrl": snapshotUrl,
        "videoUrls": videoUrls.toJson(),
        "videoDetails": videoDetails.toJson(),
        "originalVideoUrl": originalVideoUrl,
        "createTime": createTime.toIso8601String(),
      };
}

class VideoDetails {
  List<Android> ios;
  List<Android> android;

  VideoDetails({
    required this.ios,
    required this.android,
  });

  factory VideoDetails.fromJson(Map<String, dynamic> json) => VideoDetails(
        ios: List<Android>.from(json["ios"].map((x) => Android.fromJson(x))),
        android:
            List<Android>.from(json["android"].map((x) => Android.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ios": List<dynamic>.from(ios.map((x) => x.toJson())),
        "android": List<dynamic>.from(android.map((x) => x.toJson())),
      };
}

class Android {
  String videoTypeCode;
  String videoUrl;
  bool hasAudio;

  Android({
    required this.videoTypeCode,
    required this.videoUrl,
    required this.hasAudio,
  });

  factory Android.fromJson(Map<String, dynamic> json) => Android(
        videoTypeCode: json["videoTypeCode"],
        videoUrl: json["videoUrl"],
        hasAudio: json["hasAudio"],
      );

  Map<String, dynamic> toJson() => {
        "videoTypeCode": videoTypeCode,
        "videoUrl": videoUrl,
        "hasAudio": hasAudio,
      };
}

class FluffyDisplay {
  String? displayName;
  List<String> images;
  String flag;
  FluffySource? source;
  List<Profile>? profiles;
  bool? displayPrepStepsInline;
  List<dynamic>? collections;
  String? title;
  dynamic description;
  dynamic callToActionText;
  String? cardType;
  String? textLocation;
  dynamic iconImage;
  String? url;
  String? displayNameH2;

  FluffyDisplay({
    this.displayName,
    required this.images,
    required this.flag,
    this.source,
    this.profiles,
    this.displayPrepStepsInline,
    this.collections,
    this.title,
    this.description,
    this.callToActionText,
    this.cardType,
    this.textLocation,
    this.iconImage,
    this.url,
    this.displayNameH2,
  });

  factory FluffyDisplay.fromJson(Map<String, dynamic> json) => FluffyDisplay(
        displayName: json["displayName"],
        images: List<String>.from(json["images"].map((x) => x)),
        flag: json["flag"],
        source: json["source"] == null
            ? null
            : FluffySource.fromJson(json["source"]),
        profiles: json["profiles"] == null
            ? []
            : List<Profile>.from(
                json["profiles"]!.map((x) => Profile.fromJson(x))),
        displayPrepStepsInline: json["displayPrepStepsInline"],
        collections: json["collections"] == null
            ? []
            : List<dynamic>.from(json["collections"]!.map((x) => x)),
        title: json["title"],
        description: json["description"],
        callToActionText: json["callToActionText"],
        cardType: json["cardType"],
        textLocation: json["textLocation"],
        iconImage: json["iconImage"],
        url: json["url"],
        displayNameH2: json["displayName_h2"],
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "images": List<dynamic>.from(images.map((x) => x)),
        "flag": flag,
        "source": source?.toJson(),
        "profiles": profiles == null
            ? []
            : List<dynamic>.from(profiles!.map((x) => x.toJson())),
        "displayPrepStepsInline": displayPrepStepsInline,
        "collections": collections == null
            ? []
            : List<dynamic>.from(collections!.map((x) => x)),
        "title": title,
        "description": description,
        "callToActionText": callToActionText,
        "cardType": cardType,
        "textLocation": textLocation,
        "iconImage": iconImage,
        "url": url,
        "displayName_h2": displayNameH2,
      };
}

class FluffySource {
  String? sourceRecipeUrl;
  String? sourceFaviconUrl;
  bool? sourceHttpsOk;
  bool? sourceInFrame;
  String sourceDisplayName;
  bool? proSource;
  String sourceSiteUrl;
  IntroVideo? introVideo;
  String? eyebrowText;
  String? sourcePageUrl;
  String? marketingCopy;
  bool? sourceHttpOk;
  String? marketingImage;

  FluffySource({
    this.sourceRecipeUrl,
    this.sourceFaviconUrl,
    this.sourceHttpsOk,
    this.sourceInFrame,
    required this.sourceDisplayName,
    this.proSource,
    required this.sourceSiteUrl,
    this.introVideo,
    this.eyebrowText,
    this.sourcePageUrl,
    this.marketingCopy,
    this.sourceHttpOk,
    this.marketingImage,
  });

  factory FluffySource.fromJson(Map<String, dynamic> json) => FluffySource(
        sourceRecipeUrl: json["sourceRecipeUrl"],
        sourceFaviconUrl: json["sourceFaviconUrl"],
        sourceHttpsOk: json["sourceHttpsOk"],
        sourceInFrame: json["sourceInFrame"],
        sourceDisplayName: json["sourceDisplayName"],
        proSource: json["proSource"],
        sourceSiteUrl: json["sourceSiteUrl"],
        introVideo: json["introVideo"] == null
            ? null
            : IntroVideo.fromJson(json["introVideo"]),
        eyebrowText: json["eyebrowText"],
        sourcePageUrl: json["sourcePageUrl"],
        marketingCopy: json["marketingCopy"],
        sourceHttpOk: json["sourceHttpOk"],
        marketingImage: json["marketingImage"],
      );

  Map<String, dynamic> toJson() => {
        "sourceRecipeUrl": sourceRecipeUrl,
        "sourceFaviconUrl": sourceFaviconUrl,
        "sourceHttpsOk": sourceHttpsOk,
        "sourceInFrame": sourceInFrame,
        "sourceDisplayName": sourceDisplayName,
        "proSource": proSource,
        "sourceSiteUrl": sourceSiteUrl,
        "introVideo": introVideo?.toJson(),
        "eyebrowText": eyebrowText,
        "sourcePageUrl": sourcePageUrl,
        "marketingCopy": marketingCopy,
        "sourceHttpOk": sourceHttpOk,
        "marketingImage": marketingImage,
      };
}

class FluffySeo {
  PurpleWeb web;
  SpotlightSearch spotlightSearch;
  PurpleFirebase firebase;

  FluffySeo({
    required this.web,
    required this.spotlightSearch,
    required this.firebase,
  });

  factory FluffySeo.fromJson(Map<String, dynamic> json) => FluffySeo(
        web: PurpleWeb.fromJson(json["web"]),
        spotlightSearch: SpotlightSearch.fromJson(json["spotlightSearch"]),
        firebase: PurpleFirebase.fromJson(json["firebase"]),
      );

  Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
      };
}

class PurpleFirebase {
  bool? noindex;
  String? webUrl;
  String? appUrl;
  String? name;
  String? description;

  PurpleFirebase({
    this.noindex,
    this.webUrl,
    this.appUrl,
    this.name,
    this.description,
  });

  factory PurpleFirebase.fromJson(Map<String, dynamic> json) => PurpleFirebase(
        noindex: json["noindex"],
        webUrl: json["webUrl"],
        appUrl: json["appUrl"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "noindex": noindex,
        "webUrl": webUrl,
        "appUrl": appUrl,
        "name": name,
        "description": description,
      };
}

class PostSeo {
  SpotlightSearchClass web;
  SpotlightSearchClass spotlightSearch;
  SpotlightSearchClass firebase;

  PostSeo({
    required this.web,
    required this.spotlightSearch,
    required this.firebase,
  });

  factory PostSeo.fromJson(Map<String, dynamic> json) => PostSeo(
        web: SpotlightSearchClass.fromJson(json["web"]),
        spotlightSearch: SpotlightSearchClass.fromJson(json["spotlightSearch"]),
        firebase: SpotlightSearchClass.fromJson(json["firebase"]),
      );

  Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

package edu.sm.molshop3.service;

import edu.sm.molshop3.dto.ItemDto;
import edu.sm.molshop3.dto.ProductDto;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Service
public class ProductService {
    private static final Map<String, ProductDto> productMap = new HashMap<>();

    static {
        productMap.put("karina1", new ProductDto(
                "karina1",
                "카리나 공항패션 세트",
                "알렉산드라 리치 가디건 / 미우미우 팬츠 / 지방시 토트백",
                "ProductImage/product1.jpg",
                4700000,
                Arrays.asList(
                        new ItemDto("i1", "알렉산드라 리치 가디건", "럭셔리 무드 가디건", 1500000),
                        new ItemDto("i2", "미우미우 팬츠", "슬림 핏 진청 데님", 1200000),
                        new ItemDto("i3", "지방시 토트백", "미니멀 블랙 백", 2000000)
                )
        ));

        productMap.put("karina2", new ProductDto(
                "karina2",
                "윈터 착장",
                "기모 맨투맨 / 데님 팬츠 / 에코백",
                "ProductImage/product2.jpg",
                1980000,
                Arrays.asList(
                        new ItemDto("i4", "기모 맨투맨", "편안한 루즈핏", 600000),
                        new ItemDto("i5", "데님 팬츠", "빈티지 워싱 데님", 700000),
                        new ItemDto("i6", "에코백", "심플한 무지 에코백", 480000)
                )
        ));

        productMap.put("karina3", new ProductDto(
                "karina3",
                "카리나 착장 3",
                "비니 / 롱슬리브 / 카고팬츠 / 숄더백",
                "ProductImage/product3.jpg",
                327000,
                Arrays.asList(
                        new ItemDto("i7", "뉴젤리 비니", "MLB 블랙 비니", 39000),
                        new ItemDto("i8", "스퀘어넥 롱슬리브", "핏되는 기본 블랙탑", 69000),
                        new ItemDto("i9", "디토 카고팬츠", "포켓 디테일 팬츠", 71000),
                        new ItemDto("i10", "빈호보백", "타임서비스 숄더백", 148000)
                )
        ));

        productMap.put("karina4", new ProductDto(
                "karina4",
                "슬기 착장 1",
                "튜브탑 / 미디스커트 / 벨트 / 진주목걸이",
                "ProductImage/product4.jpg",
                1067000,
                Arrays.asList(
                        new ItemDto("i11", "오가닉 튜브탑", "크리스탈 파니아구아 튜브탑", 370000),
                        new ItemDto("i12", "미디 스커트", "컷아웃 디테일 스커트", 610000),
                        new ItemDto("i13", "가죽 벨트", "VJINGZVZJ 블랙 벨트", 115000),
                        new ItemDto("i14", "진주 목걸이", "블랙 진주 레이어드", 35000)
                )
        ));

        productMap.put("karina5", new ProductDto(
                "karina5",
                "윈터 캐주얼 세트",
                "티셔츠 / 비니 / 카고팬츠 / 운동화",
                "ProductImage/product5.jpg",
                788000,
                Arrays.asList(
                        new ItemDto("i15", "미싱 티셔츠", "블레어 위치 프린팅", 78000),
                        new ItemDto("i16", "리버서블 비니", "예스예스 블랙비니", 39000),
                        new ItemDto("i17", "카고팬츠", "엔타이어 스튜디오", 255000),
                        new ItemDto("i18", "운동화", "뉴발란스 1000 시리즈", 416000)
                )
        ));

        productMap.put("karina6", new ProductDto(
                "karina6",
                "슬기 화보 착장",
                "시어 탑 / 브라렛 / 스팽글 스커트 / 토트백 / 힐",
                "ProductImage/product6.jpg",
                7639000,
                Arrays.asList(
                        new ItemDto("i19", "시어 브라렛 탑", "RHEME 시스루탑", 150000),
                        new ItemDto("i20", "스팽글 미디 스커트", "PLAN C 금빛 스커트", 1320000),
                        new ItemDto("i21", "하프문 백", "준야 와타나베 자수 백", 2700000),
                        new ItemDto("i22", "노랑 뮬 힐", "GUCCI 자수 뮬힐", 1580000),
                        new ItemDto("i23", "화이트 힐", "MIUMIU 크리스탈 힐", 2060000),
                        new ItemDto("i24", "블랙 스트랩 힐", "YSL 115mm 샌들", 1945000),
                        new ItemDto("i25", "레더 샌들", "지방시 블랙 레더", 1220000)
                )
        ));

        productMap.put("karina7", new ProductDto(
                "karina7",
                "닝닝 시크룩",
                "봄버 재킷 / 탱크탑 / 롱부츠",
                "ProductImage/product7.jpg",
                3862000,
                Arrays.asList(
                        new ItemDto("i26", "클래식 봄버 재킷", "032c 블랙 재킷", 1050000),
                        new ItemDto("i27", "탱크탑", "MISBHV 엘라나 탑", 600000),
                        new ItemDto("i28", "롱부츠", "Y/PROJECT 어플리케 부츠", 2212000)
                )
        ));

        productMap.put("karina8", new ProductDto(
                "karina8",
                "조이 캐주얼룩",
                "롱슬리브 / 미니스커트 / 로퍼 / 토트백",
                "ProductImage/product8.jpg",
                4840000,
                Arrays.asList(
                        new ItemDto("i29", "롱슬리브 티셔츠", "미우미우 스트라이프", 1460000),
                        new ItemDto("i30", "미니스커트", "미우미우 미니 드레스", 1910000),
                        new ItemDto("i31", "레더 로퍼", "버클 포인트 로퍼", 2050000),
                        new ItemDto("i32", "토트백", "YEOMIM 오이스터백", 200000)
                )
        ));
    }

    public ProductDto getProductById(String id) {
        return productMap.get(id);
    }
}
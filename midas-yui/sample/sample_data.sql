
INSERT INTO m_kind_category (kind_category_name, kind_category_description) VALUE
("kind_category_1", "kind_category_1_d")
,("kind_category_2", "kind_category_2_d");

INSERT INTO m_purpose_category (purpose_category_name, purpose_category_description) VALUE
("purpose_category_1", "purpose_category_1_d")
,("purpose_category_2", "purpose_category_2_d");

INSERT INTO m_place_category (place_category_name, place_category_description) VALUE
("place_category_1", "place_category_1_d")
,("place_category_2", "place_category_2_d");

INSERT INTO m_kind_element (kind_element_name, kind_element_description, kind_category_id) VALUE
("kind_element_1", "kind_element_1_d", 1)
,("kind_category_2", "kind_category_2_d", 1)
,("kind_category_3", "kind_category_3_d", 2);

INSERT INTO m_purpose_element (purpose_element_name, purpose_element_description, purpose_category_id) VALUE
("purpose_element_1", "purpose_element_1_d", 1)
,("purpose_category_2", "purpsoe_category_2_d", 1)
,("purpose_category_3", "purpose_category_3_d", 2);

INSERT INTO m_place_element (place_element_name, place_element_description, place_category_id) VALUE
("place_element_1", "place_element_1_d", 1)
,("place_category_2", "place_category_2_d", 1)
,("place_category_3", "place_category_3_d", 2);

INSERT INTO m_balance (amount, item, kind_element_id, purpose_element_id, place_element_id, date) VALUE
(-453, "test", 3, 1, 2, "2021/2/22")
,(-535, "test2", 3, 1, 2, "2021/2/22")
,(-53535, "test2", 3, 2, 1, "2021/2/22");






INSERT INTO m_kind_element (kind_element_id, kind_element_name, kind_element_description, kind_category_id) VALUE
(14, "move", "move", 1);
INSERT INTO m_purpose_element (purpose_element_id, purpose_element_name, purpose_element_description, purpose_category_id) VALUE
(12, "move", "move", 1);
INSERT INTO m_place_element (place_element_id, place_element_name, place_element_description, place_category_id) VALUE
(4, "move", "move", 1);

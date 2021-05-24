package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Lend implements Serializable {
    private long serNum;//id
    private long bookId;//书籍id
    private long readerId;//读者id
    private Date lendDate;//借出时间
    private Date backDate;//归还时间
}

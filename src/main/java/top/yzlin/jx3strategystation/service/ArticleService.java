package top.yzlin.jx3strategystation.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.yzlin.jx3strategystation.dao.ArticleDAO;
import top.yzlin.jx3strategystation.database.OperateQuery;
import top.yzlin.jx3strategystation.entity.community.*;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class ArticleService {
    private final ArticleDAO articleDAO;

    public ArticleService(ArticleDAO articleDAO) {
        this.articleDAO = articleDAO;
    }

    public int saveArticle(BaseArticle baseArticle) {
        return articleDAO.saveArticle(baseArticle);
    }

    public BaseArticle findArticleByIdAndUserName(int articleId, String userName) {
        return articleDAO.findArticleByIdAndUserName(articleId, userName);
    }

    public BaseArticle findArticleById(int id) {
        return articleDAO.findArticleById(id);
    }

    public List<BaseArticle> findArticle(int page) {
        return articleDAO.findArticle(page);
    }

    public List<BaseArticle> findArticle(OperateQuery operateQuery) {
        return articleDAO.findArticle(operateQuery);
    }

    public void deleteArticleById(int id) {
        articleDAO.deleteArticleById(id);
    }

    public List<StrategyArticle> findStrategyArticle() {
        return articleDAO.findStrategyArticle();
    }

    public List<TradingArticle> findTradingArticle() {
        return articleDAO.findTradingArticle();
    }

    public List<CommonArticle> findCommonArticle() {
        return articleDAO.findCommonArticle();
    }

    public List<AnnouncementArticle> findAnnouncementArticleByInstance(String instance) {
        return articleDAO.findAnnouncementArticleByInstance(instance);
    }

    public List<BaseArticle> findArticleByUserId(int userId) {
        return articleDAO.findArticleByUserId(userId);
    }


}

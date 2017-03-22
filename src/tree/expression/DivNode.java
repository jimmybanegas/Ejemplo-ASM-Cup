/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tree.expression;

import codegeneration.ExpressionCode;

/**
 *
 * @author Eduardo
 */
public class DivNode extends BinaryOperatorNode{

    public DivNode(ExpressionNode raito, ExpressionNode leftou) {
        super(raito, leftou);
    }

    @Override
    public float evaluate() {
        return leftou.evaluate()/raito.evaluate();
    }

    @Override
    public ExpressionCode GenerateCode() {
        return null;
    }

}
